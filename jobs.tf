resource "aws_glue_job" "job_boletos_conversor" {
  name     = "job_boletos_conversor"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_boletos_conversor"
  }
}

resource "aws_glue_job" "job_boletos_filtrador" {
  name     = "job_boletos_filtrador"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_boletos_filtrador" 
	}
}


resource "aws_glue_job" "job_bonus_seletor" {
  name     = "job_bonus_seletor"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_bonus_seletor"
  }
}

resource "aws_glue_job" "job_bonus_boletos_agrupador" {
  name     = "job_bonus_boletos_agrupador"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_bonus_boletos_agrupador"
  }
}


resource "aws_glue_job" "job_bonus_boletos_join" {
  name     = "job_bonus_boletos_join"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_bonus_boletos_join"
  }
}

resource "aws_glue_job" "job_bonus_boletos_sumarizador" {
  name     = "job_bonus_boletos_sumarizador"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_bonus_boletos_sumarizador"
  }
}