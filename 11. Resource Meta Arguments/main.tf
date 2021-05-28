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
}

provider "aws" {
  alias = "east"
  region = "us-east-1"  
}


locals {
  setup_name = "main"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "172.30.0.0/16"
  tags = {
    "Name" = "${local.setup_name}-vpc"
  }
}


resource "aws_subnet" "main_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "172.30.0.0/20"

  tags = {
    "Name" = "${local.setup_name}-subnet"
  }
}
resource "aws_instance" "ec2instance_east" {
  provider = aws.east
  ami ="ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"  

  tags = {
    "Name" = "East Test"
  }
}

resource "aws_instance" "EC2Instance" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    subnet_id = aws_subnet.main_subnet.id

    tags = {
      "Name"= var.name
      "OS"= var.os
      "Environment"= var.environment
      "AppID"= var.app_id
    }
}

output "dns_name" {
  value = aws_instance.EC2Instance.private_dns
}

output "private_ip" {
  value = aws_instance.EC2Instance.private_ip
}
