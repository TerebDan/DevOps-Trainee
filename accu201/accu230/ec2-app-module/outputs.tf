output "app_server_dns_name" {
  value = aws_route53_record.app_django_1.name
}

output "app_server_ip" {
  value = aws_instance.APP_server.public_ip
}

output "app_server_id" {
  value = aws_instance.APP_server.id
}
