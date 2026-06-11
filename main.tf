resource "aws_instance" "Terraform_demo"{
ami = var.ami_value
instance_type = var.instance_type_value
tags = {
Terraform = "true"
} 
}

resource "aws_s3_bucket" "terraform_s3" {
    bucket = "terraform-remote-0360"
   
   tags = {
    Name = "remote backend"
   }
}