variable "ec2_instance_type" {
    type = string
    default = "t2.micro"
    description = "Type of EC2 Instance."
}

variable "ec2_ami_id" {
    type = string
    description = "EC2 Instance AMI ID"
}

#local variables
variable "name"{
    type = string
    description = "Name of Instance"
}

variable "os" {
    type = string
    description = "Operating Sytem type"
    
}

variable "environment" {
    type = string
    description = "Environment Name"
    
}

variable "app_id" {
    type = string
    description = "Application ID"  
}
    
