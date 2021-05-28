resource "aws_vpc" "main"{
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  tags = {
    "Name" = "javahome-vpc"
  }
}

resource "aws_subnet" "main" {
  count = 3
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr,8,count.index)}"

  tags = {
    "Name" = "Subnet ${count.index + 0}"
  }
}
