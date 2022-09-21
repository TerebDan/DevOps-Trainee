variable "my_tags" {
  description   = "default tags"
  type          = map
  default       = {
    Owner       = "DaniilT"
  }
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "vpc_public_subnets" {
  description = "VPC public subnets"
  type        = list(string)
}

variable "instances_id" {
  description = "nodes id"
  type        = list(string)
}
