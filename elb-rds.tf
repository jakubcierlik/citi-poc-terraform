terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.10.0"
    }
    template = {
      source = "hashicorp/template"
      version = "2.1.2"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_elb" "main_lb" {
  name               = "CloudifyELB"
  availability_zones = [ var.availability_zones ]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

#   listener {
#     instance_port      = 8000
#     instance_protocol  = "http"
#     lb_port            = 443
#     lb_protocol        = "https"
#     ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
#   }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = []  # instance ID [aws_instance.foo.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Created-by= "Cloudify"
  }
}

resource "aws_db_instance" "main_db_rds" {
  allocated_storage    = 10
  max_allocated_storage = 60  # enables autoscaling
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  deletion_protection = false
  skip_final_snapshot  = true  # do not make snapshot before db removal
}

