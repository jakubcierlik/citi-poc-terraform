terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.10.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_route53_zone" "main_zone" {
  name = var.domain_name

  tags = {
    Created-by = "Cloudify"
  }
}

resource "aws_route53_record" "main_zone_record" {
  zone_id = aws_route53_zone.main_zone.zone_id
  name    = var.domain_name
  type    = "NS"
  ttl     = "300"
  records = [ var.domain_name ]
  # records = aws_route53_zone.dev.name_servers
}
