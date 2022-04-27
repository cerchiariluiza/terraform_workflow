resource "aws_glue_workflow" "etlbonus" {
  name = "etlbonus"
}



resource "aws_glue_trigger" "trigger_start_bonus" {
  name          = "trigger_start_bonus"
  workflow_name = aws_glue_workflow.etlbonus.name

  schedule = "cron(0 1 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.job_boletos_conversor.name
  }
}

resource "aws_glue_trigger" "trigger_crawler_boletos_conversor" {
  name          = "trigger_crawler_boletos_conversor"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_boletos_conversor.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_boletos_conversor"
  }
}


resource "aws_glue_trigger" "trigger_job_filtrador" {
  name = "trigger_job_filtrador"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  actions {
   job_name = aws_glue_job.job_boletos_filtrador.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_boletos_conversor.name
      crawl_state  = "SUCCEEDED"
    }
  }
}

resource "aws_glue_trigger" "trigger_crawler_boletos_filtrador" {
  name          = "trigger_crawler_boletos_filtrador"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_boletos_filtrador.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_boletos_filtrador"
  }
}



resource "aws_glue_trigger" "trigger_boletos_seletor" {
  name = "trigger_boletos_seletor"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

actions {
    job_name = aws_glue_job.job_cadastral_digito_0.name
  }
  actions {
  
    job_name = aws_glue_job.job_cadastral_digito_1.name
  }
  actions {
    job_name = aws_glue_job.job_cadastral_digito_3.name
  }
  actions {
  
    job_name = aws_glue_job.job_cadastral_digito_4.name
  }
    actions {
    job_name = aws_glue_job.job_cadastral_digito_5.name
  }
  actions {
  
    job_name = aws_glue_job.job_cadastral_digito_6.name
  }
  actions {
    job_name = aws_glue_job.job_cadastral_digito_7.name
  }
  actions {
  
    job_name = aws_glue_job.job_cadastral_digito_8.name
  }
    actions {
    job_name = aws_glue_job.job_cadastral_digito_9.name
  }



  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_boletos_filtrador.name
      crawl_state  = "SUCCEEDED"
    }
  }

}
resource "aws_glue_trigger" "trigger_crawler_boletos_seletor" {
  name          = "trigger_crawler_boletos_seletor"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_cadastral_digito_0.name
      state    = "SUCCEEDED"
  

    }
     conditions {
      job_name = aws_glue_job.job_cadastral_digito_1.name
      state    = "SUCCEEDED"

    }
        conditions {
      job_name = aws_glue_job.job_cadastral_digito_2.name
      state    = "SUCCEEDED"
  

    }
     conditions {
      job_name = aws_glue_job.job_cadastral_digito_3.name
      state    = "SUCCEEDED"

    }
     
     conditions {
      job_name = aws_glue_job.job_cadastral_digito_4.name
      state    = "SUCCEEDED"

    }
        conditions {
      job_name = aws_glue_job.job_cadastral_digito_5.name
      state    = "SUCCEEDED"
  

    }
     conditions {
      job_name = aws_glue_job.job_cadastral_digito_6.name
      state    = "SUCCEEDED"

    }
        conditions {
      job_name = aws_glue_job.job_cadastral_digito_7.name
      state    = "SUCCEEDED"
  

    }
     conditions {
      job_name = aws_glue_job.job_cadastral_digito_8.name
      state    = "SUCCEEDED"

    }
        conditions {
      job_name = aws_glue_job.job_cadastral_digito_9.name
      state    = "SUCCEEDED"
  

    }
   
  }
    actions {
    crawler_name = "crowler_boletos_seletor"
  }
}

resource "aws_glue_trigger" "trigger_bonus_seletor" {
  name = "trigger_bonus_seletor"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  actions {
   job_name = aws_glue_job.job_bonus_seletor.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_boletos_seletor.name
      crawl_state  = "SUCCEEDED"
    }
  }
}



resource "aws_glue_trigger" "trigger_crawler_bonus_seletor" {
  name          = "trigger_crawler_bonus_seletor"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_bonus_seletor.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_bonus_seletor"
  }

}



resource "aws_glue_trigger" "trigger_bonus_boletos_agrupador" {
  name = "trigger_bonus_boletos_agrupador"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  actions {
   job_name = aws_glue_job.job_bonus_boletos_agrupador.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_bonus_seletor.name
      crawl_state  = "SUCCEEDED"
    }
  }
}

resource "aws_glue_trigger" "trigger_crawler_agrupador" {
  name          = "trigger_crawler_jagrupador"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_bonus_boletos_agrupador.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_bonus_boletos_agrupador"
  }

}


#processo join
#processo agrupador job e crawl
resource "aws_glue_trigger" "trigger_job_join" {
  name = "trigger_job_join"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  actions {
   job_name = aws_glue_job.job_bonus_boletos_join.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_bonus_boletos_agrupador.name
      crawl_state  = "SUCCEEDED"
    }
  }
}
resource "aws_glue_trigger" "trigger_crawler_boletos_join" {
  name          = "trigger_crawler_boletos_join"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_bonus_boletos_join.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_bonus_boletos_join"
  }

}

resource "aws_glue_trigger" "trigger_job_sumarizador" {
  name = "trigger_job_sumarizador"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  actions {
   job_name = aws_glue_job.job_bonus_boletos_sumarizador.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_bonus_boletos_join.name
      crawl_state  = "SUCCEEDED"
    }
  }
}
resource "aws_glue_trigger" "trigger_crawler_sumarizador" {
  name          = "trigger_crawler_sumarizador"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etlbonus.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_bonus_boletos_sumarizador.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_bonus_boletos_sumarizador"
  }

}