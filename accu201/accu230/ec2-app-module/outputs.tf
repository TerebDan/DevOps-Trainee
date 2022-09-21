output "app_server_dns_name" {
  value = aws_route53_record.app_django_1.name
}

output "app_private_ip" {
  value = aws_instance.APP_server.private_ip
}

output "app_server_id" {
  value = aws_instance.APP_server.id
}
