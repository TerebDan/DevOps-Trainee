variable "my_tags" {
  description   = "default tags"
  type          = map
  default       = {
    Owner       = "DaniilT"
  }
}

variable "ssh_key_name" {
  description = "ssh key name"
  type        = string
  default     = "MyKeyPair"
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

variable "subnet_id" {
  description = "VPC subnet id"
  type        = string
}
