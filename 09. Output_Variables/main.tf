terraform {
  required_providers{
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.0"
        }
  }
}

# Configure AWS Provider
provider "aws" {
    region = "us-east-2"
    access_key = "AKIA4JQ4B57YX6UMGGDP"
    secret_key = "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"
}

locals {
  setup_name = "main"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "172.31.0.0/16"
  tags = {
    "Name" = "${local.setup_name}-vpc"
  }
  
}

resource "aws_subnet" "main_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "172.31.0.0/20"
  tags = {
    "Name" = "${local.setup_name}-subnet"
  }
  
}

resource "aws_instance" "EC2Instance" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type

    tags = {
      "Name"= var.name 
      "OS"= var.os
      "Environment"= var.environment
      "AppID"= var.app_id
    }
}

output "Public_IP" {
  value = aws_instance.EC2Instance.public_ip
}
output "DNS_Name" {
  value = aws_instance.EC2Instance.public_dns
}
