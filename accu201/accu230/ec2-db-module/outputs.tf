output "db_server_dns_name" {
  value = aws_route53_record.db1.name
}

output "db_private_ip" {
  value = aws_instance.DB_server.private_ip
}
