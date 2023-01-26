variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "my_tags" {
  description   = "default tags"
  type          = map
  default       = {
    Owner       = "DaniilT"
  }
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "vpc_database_subnets" {
  description = "VPC database subnets"
  type        = list(string)
}
