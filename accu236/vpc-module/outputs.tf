output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "vpc_private_subnets" {
  description = "VPC private subnets"
  value       = module.vpc.private_subnets
}

output "vpc_database_subnets" {
  description = "VPC database subnets"
  value       = module.vpc.database_subnets
}
