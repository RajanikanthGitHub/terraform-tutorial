locals {
  instance_name = "${terraform.workspace} - ${var.region} - instance"
}

resource "aws_instance" "WebServer" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    "Name" = local.instance_name
  }
}