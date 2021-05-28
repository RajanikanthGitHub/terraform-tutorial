provider "aws" {
    region = "us-west-2"  
}

data "aws_vpc" "main" {
    default = ture
}

locals {
  baz = hello
}

variable "testing" {
    type = map
    default = {
        foo = 123
        bar = 555
    }
}

resource "aws_instance" "web" {
    count = 2
    ami = "ami-00399ec92321828f5"
    instance_type = "t2.micro"

    tags = {
      "Name" = "Tuts Test ${count.index}"
    }
}

output "foo" {
    value = [for k, v in var.testing : k if k == "foo"]
}


resource "aws_instance" "tuts" {
    ami = "ami-00399ec92321828f5"
    instance_type = "t2.micro"

    tags = {
      "Name" = "Tuts Test ${local.buz}"

      foo = local.baz == "aaa" ? "yes" : "No"

      bar = <<EOT
            testing foo
        EOT

      baz = <<-EOT
            hello from baz, no identation with "-" 
        EOT
    
        testing_if = "Hello , %{if var.name !=""} ${var.name} % {else}unamed%{ endif }!"

        testing_loop = <<EOT
            %{ for ip in aws_instance.example.*.private_ip }
            server ${ip}
           %{endfor}
    }
} 