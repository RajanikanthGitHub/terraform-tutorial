terraform {
  backend "s3" {
    bucket = "demotfstate"
    key    = "global/s3/demo-terraform.tfstate"
    region = "us-east-1"
  }
}