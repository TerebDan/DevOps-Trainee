variable "mysql_pass" {
  description   = "MySQL password"
  type          = string
}

variable "mysql_login" {
  description   = "MySQL login"
  type          = string
}

variable "my_tags" {
  description   = "default tags"
  type          = map
  default       = {
    Owner       = "DaniilT"
  }
}

provider "aws" {}

resource "aws_db_instance" "default" {
  identifier           = "mydb"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.mysql_login
  password             = var.mysql_pass
  skip_final_snapshot  = true
  apply_immediately    = true
  publicly_accessible  = true
  tags                 = var.my_tags
}