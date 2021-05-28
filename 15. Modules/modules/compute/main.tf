module "vpc_module" {
  source = "D:/Practice/course/terraform/15. Modules/modules/vpc_moudle"
}

resource "aws_instance" "myec2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = module.vpc_module.privateid

    tags = {
      "Name" = "EC2-Extended_Module"
    }
}