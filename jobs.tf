resource "aws_glue_job" "job_seletorteste" {
  name     = "job_seletorteste"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_seletor_bonus"
  }
}

resource "aws_glue_job" "job_agrupadorteste" {
  name     = "job_agrupadorteste"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_agrupador"
  }
}

resource "aws_glue_job" "job_jointeste" {
  name     = "job_jointeste"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_add_soma"
  }
}


resource "aws_glue_job" "job_sumarizadorteste" {
  name     = "job_sumarizadorteste"
  role_arn = "arn:aws:iam::687529362065:role/sage"

  command {
    script_location = "s3://aws-glue-scripts-687529362065-us-east-1/root/job_sumarizador"
  }
}