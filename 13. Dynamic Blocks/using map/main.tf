data "aws_vpc" "main" {
    default = true
}

locals {
  map = {
    "description 0" = {
      port = 80,
      cidr_blocks = ["0.0.0.0/0"]
    }
    "description 1"= {
      port = 81,
      cidr_blocks = ["10.0.0.0/16"]
    }
  }

}

resource "aws_instance" "myec2db" {
  ami = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.map.name]

  tags = {
    "Name" = "Web Server"
  }
}

resource "aws_security_group" "map" {
  name = "demo-map"
  description = "demo-map"

  dynamic "ingress" {
    for_each = local.map
    content {
      description  = ingress.key
      from_port    = ingress.value.port
      to_port      = ingress.value.port
      protocol = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

output "map" {
  value = aws_security_group.map
  
}
