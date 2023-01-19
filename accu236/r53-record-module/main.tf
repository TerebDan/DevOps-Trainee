provider "aws" {}

resource "aws_route53_record" "eks_lb" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "eks_lb.DaniilT.lab.vandergizer.com"
  type    = "A"
  
  alias {
    name                   = var.dns_name
    zone_id                = var.zone_id
    evaluate_target_health = true
  }

}
