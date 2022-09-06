variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "mysql_pass" {
  description   = "MySQL password"
  type          = string
}

variable "mysql_login" {
  description   = "MySQL login"
  type          = string
}

variable "my_tags" {
  description   = "default tags"
  type          = map
  default       = {
    Owner       = "DaniilT"
  }
}

variable "cluster_name" {
  description = "AWS region"
  type        = string
  default     = "education-eks"
}