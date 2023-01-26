provider "aws" {}

resource "aws_route53_record" "eks_lb_api" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "api.lab.vandergizer.com"
  type    = "A"
  
  alias {
    name                   = var.dns_name
    zone_id                = var.zone_id
    evaluate_target_health = true
  }

}

resource "aws_route53_record" "eks_lb_client" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "ez.lab.vandergizer.com"
  type    = "A"
  
  alias {
    name                   = var.dns_name
    zone_id                = var.zone_id
    evaluate_target_health = true
  }

}

resource "aws_route53_record" "db" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "www.ez.lab.vandergizer.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_route53_record.eks_lb_client.name]
}

resource "aws_route53_record" "eks_lb_legal" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "legal.lab.vandergizer.com"
  type    = "A"
  
  alias {
    name                   = var.dns_name
    zone_id                = var.zone_id
    evaluate_target_health = true
  }

}
