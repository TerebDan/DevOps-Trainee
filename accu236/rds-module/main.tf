provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "default" {
  name        = "rds-subnet-group"
  description = "Terraform RDS subnet group"
  subnet_ids  = var.vpc_database_subnets

  tags = var.my_tags
}

resource "aws_security_group" "db_rules" {
  name               = "db_rules"
  vpc_id             = var.vpc_id 

  ingress {
    from_port        = 5432
    to_port          = 5432
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

resource "aws_db_instance" "default" {
  identifier              = "mydb1"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = var.mysql_login
  password                = var.mysql_pass
  skip_final_snapshot     = true
  apply_immediately       = true
  publicly_accessible     = true
  db_subnet_group_name      = aws_db_subnet_group.default.id
  vpc_security_group_ids  = [ aws_security_group.db_rules.id ]
  
  tags                    = var.my_tags
}
