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
