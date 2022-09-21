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

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "education-eks"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "vpc_private_subnets" {
  description = "VPC private subnets"
  type        = list(string)
}
