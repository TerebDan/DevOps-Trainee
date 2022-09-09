provider "aws" {
  region = var.region
}

resource "aws_instance" "APP_server" {
    ami = "ami-065deacbcaac64cf2"
    instance_type = "t2.micro"
    key_name = var.ssh_key_name
    vpc_security_group_ids = [ aws_security_group.app_rules.id ]
    subnet_id = var.subnet_id

    tags = var.my_tags
}

resource "aws_security_group" "app_rules" {
  name        = "app_rules"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 8000
    to_port          = 8000
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

  tags = var.my_tags
}

resource "aws_route53_record" "app_django_1" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "app_django_1.DaniilT.lab.vandergizer.com"
  type    = "A"
  ttl     = 300
  records = [ aws_instance.APP_server.public_ip  ]
}
