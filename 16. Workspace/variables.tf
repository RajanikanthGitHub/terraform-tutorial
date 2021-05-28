variable "region" {
  type        = string
  default     = "us-east-2"
  description = "Provid Region Name"
}

variable "ami_id" {
  type        = string
  description = "Provide AMI ID which belongs to same region"

}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Provide Instance Type"
}