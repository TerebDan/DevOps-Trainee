provider "aws" {}

resource "aws_instance" "Load_balancer" {
    ami = "ami-0c956e207f9d113d5"
    instance_type = "t2.micro"
    key_name = "MyKeyPair"

    tags = {
        Creator = "DaniilT"
    }
}

resource "aws_instance" "DB_server" {
    ami = "ami-065deacbcaac64cf2"
    instance_type = "t2.micro"
    key_name = "MyKeyPair"

    tags = {
        Creator = "DaniilT"
    }
}

resource "aws_instance" "APP_server" {
    ami = "ami-065deacbcaac64cf2"
    instance_type = "t2.micro"
    key_name = "MyKeyPair"

    tags = {
        Creator = "DaniilT"
    }
}

resource "aws_route53_record" "lb" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "lb.DaniilT.lab.vandergizer.com"
  type    = "A"
  ttl     = 300
  records = [ aws_instance.Load_balancer.public_ip  ]
}

resource "aws_route53_record" "db1" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "db1.DaniilT.lab.vandergizer.com"
  type    = "A"
  ttl     = 300
  records = [ aws_instance.DB_server.public_ip  ]
}

resource "aws_route53_record" "app_django_1" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "app_django_1.DaniilT.lab.vandergizer.com"
  type    = "A"
  ttl     = 300
  records = [ aws_instance.APP_server.public_ip  ]
}

output "lb_server_dns_name" {
  value = aws_route53_record.lb.name
}

output "lb_server_ip" {
  value = aws_instance.Load_balancer.public_ip
}

output "db_server_dns_name" {
  value = aws_route53_record.db1.name
}

output "db_server_ip" {
  value = aws_instance.DB_server.public_ip
}

output "app_server_dns_name" {
  value = aws_route53_record.app_django_1.name
}

output "app_server_ip" {
  value = aws_instance.APP_server.public_ip
}
