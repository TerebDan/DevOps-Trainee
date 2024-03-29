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

resource "aws_security_group" "db_rules" {
  name               = "db_rules"

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags               = var.my_tags
}

resource "aws_s3_bucket" "b" {
  bucket = "backup-bucket-for-rds"

  tags = var.my_tags
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.b.bucket
  key    = "backup"
  source = "/home/dan/trainee/accu201/accu203/dump.sql"
}

resource "aws_db_instance" "default" {
  identifier              = "mydb1
  "
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = var.mysql_login
  password                = var.mysql_pass
  skip_final_snapshot     = true
  apply_immediately       = true
  publicly_accessible     = true
  vpc_security_group_ids  = [ aws_security_group.db_rules.id ]
  
  tags                    = var.my_tags
}
