variable "aws_region" {
  type = string
  description = "AWS region to launch servers."
}

variable "access_key" {
  type = string
  description = "Access key for AWS"
}

variable "secret_key" {
  type = string
  description = "Secret key for AWS"
}

variable "availability_zones" {
  type = list
  description = "ELB availability zones"
}

variable "db_name" {
  type = string
  description = "Name of the database to be created"
}

variable "db_username" {
  type = string
  description = "Name of the database user"
}

variable "db_password" {
  type = string
  description = "Password of the database user"
}

variable "domain_name" {
  type = string
  description = "Name of the domain in Route53"
}

# variable "admin_key_public" {
#   type = string
#   description = "Public SSH key of admin user"
# }
