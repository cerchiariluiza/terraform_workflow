resource "aws_glue_crawler" "crowler_cadastral_p" {
  database_name = "banco_bonus"
  name          = "crowler_cadastarl_p"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}
resource "aws_glue_crawler" "crowler_boletos_conversor" {
  database_name = "banco_bonus"
  name          = "crowler_boletos_conversor"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}
resource "aws_glue_crawler" "crowler_boletos_filtrador" {
  database_name = "banco_bonus"
  name          = "crowler_boletos_filtrador"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}

resource "aws_glue_crawler" "crowler_boletos_seletor" {
  database_name = "banco_bonus"
  name          = "crowler_boletos_seletor"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}


resource "aws_glue_crawler" "crowler_bonus_seletor" {
  database_name = "banco_bonus"
  name          = "crowler_bonus_seletor"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}

resource "aws_glue_crawler" "crowler_bonus_boletos_agrupador" {
  database_name = "banco_bonus"
  name          = "crowler_bonus_boletos_agrupador"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}



resource "aws_glue_crawler" "crowler_bonus_boletos_join" {
  database_name = "banco_bonus"
  name          ="crowler_bonus_boletos_join"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}
resource "aws_glue_crawler" "crowler_bonus_boletos_sumarizador" {
  database_name = "banco_bonus"
  name          = "crowler_bonus_boletos_sumarizador"
  role = "arn:aws:iam::687529362065:role/sage"
  table_prefix = "tb_"

  s3_target {
    path = "s3://mudeee-der/bonus/finish/"
  }
}


