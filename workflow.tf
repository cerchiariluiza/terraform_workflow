resource "aws_glue_workflow" "etl" {
  name = "etl"
}


#processo seletor job e crawl
resource "aws_glue_trigger" "trigger_start" {
  name          = "trigger_start"
  workflow_name = aws_glue_workflow.etl.name

  schedule = "cron(0 1 * * ? *)"
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.job_seletorteste.name
  }
}
resource "aws_glue_trigger" "trigger_crawler_seletor" {
  name          = "trigger_crawler_seletor"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etl.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_seletorteste.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_seletor"
  }
}

#processo agrupador job e crawl
resource "aws_glue_trigger" "trigger_job_agrupador" {
  name = "trigger_job_agrupador"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etl.name

  actions {
   job_name = aws_glue_job.job_agrupadorteste.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_seletor.name
      crawl_state  = "SUCCEEDED"
    }
  }
}

resource "aws_glue_trigger" "trigger_crawler_agrupador" {
  name          = "trigger_crawler_agrupador"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etl.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_agrupadorteste.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_agrupador"
  }
}

#processo join
#processo agrupador job e crawl
resource "aws_glue_trigger" "trigger_job_join" {
  name = "trigger_job_join"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etl.name

  actions {
   job_name = aws_glue_job.job_jointeste.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_agrupador.name
      crawl_state  = "SUCCEEDED"
    }
  }
}

resource "aws_glue_trigger" "trigger_crawler_join" {
  name          = "trigger_crawler_join"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etl.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_jointeste.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_join"
  }

}


#processo join
#processo agrupador job e crawl
resource "aws_glue_trigger" "trigger_job_sumarizador" {
  name = "trigger_job_sumarizador"
  type = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etl.name

  actions {
   job_name = aws_glue_job.job_sumarizadorteste.name
  }

  predicate {
    conditions {
      crawler_name = aws_glue_crawler.crowler_join.name
      crawl_state  = "SUCCEEDED"
    }
  }
}
resource "aws_glue_trigger" "trigger_crawler_sumarizador" {
  name          = "trigger_crawler_sumarizador"
  type          = "CONDITIONAL"
  workflow_name = aws_glue_workflow.etl.name

  predicate {
    conditions {
      job_name = aws_glue_job.job_sumarizadorteste.name
      state    = "SUCCEEDED"
    }
  }

  actions {
    crawler_name = "crowler_sumarizador"
  }

}




