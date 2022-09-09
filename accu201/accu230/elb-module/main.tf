provider "aws" {
  region = var.region
}

resource "aws_elb" "main" {
  name               = "my-elb"
  security_groups = [ aws_security_group.lb_rules.id ]
  subnets = var.vpc_public_subnets

  listener {
    instance_port     = 30000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = var.instances_id 

  tags = var.my_tags
}

resource "aws_security_group" "lb_rules" {
  name        = "lb_rules"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
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

resource "aws_route53_record" "elb" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "elb.DaniilT.lab.vandergizer.com"
  type    = "A"
  
  alias {
    name                   = aws_elb.main.dns_name
    zone_id                = aws_elb.main.zone_id
    evaluate_target_health = true
  }

}
