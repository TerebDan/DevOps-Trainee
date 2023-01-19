output "eks_dns_name" {
  value = aws_route53_record.eks_lb.name
}

