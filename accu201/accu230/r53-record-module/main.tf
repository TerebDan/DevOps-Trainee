provider "aws" {}

resource "aws_route53_record" "eks_lb" {
  zone_id = "Z01242703EIVQQ2V4GNJ8"
  name    = "eks_lb.DaniilT.lab.vandergizer.com"
  type    = "A"
  ttl     = 300
  records = [ var.eks_lb_domain_name  ]
}
