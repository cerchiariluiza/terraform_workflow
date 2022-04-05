resource "aws_glue_crawler" "crowler_seletor" {
  database_name = "banco_bonus"
  name          = "crowler_seletor"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://dadosrelacionamento-der/bonus/selecao/"
  }
}

resource "aws_glue_crawler" "crowler_agrupador" {
  database_name = "banco_bonus"
  name          = "crowler_agrupador"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://dadosrelacionamento-der/bonus/agrupador/"
  }
}

resource "aws_glue_crawler" "crowler_join" {
  database_name = "banco_bonus"
  name          = "crowler_join"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"
  s3_target {
    path = "s3://dadosrelacionamento-der/bonus/join/"
  }
}

resource "aws_glue_crawler" "crowler_sumarizador" {
  database_name = "banco_bonus"
  name          = "crowler_sumarizador"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"
  s3_target {
    path = "s3://dadosrelacionamento-der/bonus/sumarizador/"
  }
}

