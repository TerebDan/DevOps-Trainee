output "lb_server_dns_name" {
  value = aws_route53_record.lb.name
}

output "lb_server_ip" {
  value = aws_instance.Load_balancer.public_ip
}
