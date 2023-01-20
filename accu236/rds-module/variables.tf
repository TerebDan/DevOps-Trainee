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

variable "dump_path" {
  description = "path to MySQL dump file"
  type        = string
  default     = "/home/dan/trainee/accu201/accu230/dump.sql"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "vpc_database_subnets" {
  description = "VPC database subnets"
  type        = list(string)
}
