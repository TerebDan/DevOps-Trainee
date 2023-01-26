output "eks_dns_name_api" {
  value = aws_route53_record.eks_lb_api.name
}

output "eks_dns_name_client" {
  value = aws_route53_record.eks_lb_client.name
}

output "eks_dns_name_legal" {
  value = aws_route53_record.eks_lb_legal.name
}

