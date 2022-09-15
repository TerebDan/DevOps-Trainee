provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "default" {
  name        = "rds-subnet-group"
  description = "Terraform RDS subnet group"
  subnet_ids  = var.vpc_public_subnets

  tags = var.my_tags
}

resource "aws_security_group" "db_rules" {
  name               = "db_rules"
  vpc_id             = var.vpc_id 

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
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

resource "aws_iam_role" "rds_role" {
  name = "rds-s3-import-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "rds.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  tags = var.my_tags
}

resource "aws_iam_policy" "rds_policy" {
  name        = "rds-s3-import-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "s3import"
        Action = "s3:*"
        Effect = "Allow"
        Resource = "*" 
      },
    ] 
  })

  tags = var.my_tags
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.rds_role.name
  policy_arn = aws_iam_policy.rds_policy.arn
}

resource "aws_s3_bucket" "b" {
  bucket = "backup-bucket-for-rds"

  tags   = var.my_tags
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.b.bucket
  key    = "backup"
  source = var.dump_path

  tags   = var.my_tags
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
