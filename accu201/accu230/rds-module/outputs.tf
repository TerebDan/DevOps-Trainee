output "db_endpoint" {
  description = "Kubernetes Cluster Name"
  value       = aws_db_instance.default.endpoint
}

output "db_private_ip" {
  value = aws_db_instance.default.address
}
