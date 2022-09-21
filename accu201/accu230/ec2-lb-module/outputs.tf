output "lb_server_dns_name" {
  value = aws_route53_record.lb.name
}
