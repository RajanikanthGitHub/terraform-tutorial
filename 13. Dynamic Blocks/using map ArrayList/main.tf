data "aws_vpc" "main" {
    default = true
}

locals {
  rules = [{
    description = "description 0", 
    port = 80,
    cidr_blocks = ["0.0.0.0/0"]
  } , {
    description = "description 1", 
    port = 81,
    cidr_blocks = ["10.0.0.0/16"]
  }]
}

resource "aws_instance" "myec2db" {
  ami = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.attrs.name]

  tags = {
    "Name" = "Web Server"
  }
}

resource "aws_security_group" "attrs" {
  name = "demo-attrs"
  description = "demo-attrs"

  dynamic "ingress" {
    for_each = local.rules
    content {
      description  = ingress.value.description
      from_port    = ingress.value.port
      to_port      = ingress.value.port
      protocol = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

output "map" {
  value = aws_security_group.attrs
  
}
