output "subnet" {
    value = aws_instance.Terraform_demo.subnet_id
}

output "public_ip" {
    value = aws_instance.Terraform_demo.public_ip
  
}

output "type" {
  value = aws_instance.Terraform_demo.instance_type
}

output  "security_group" {
    value = aws_instance.Terraform_demo.security_groups
}

output "aws_s3_bucket_acl" {
    value = aws_s3_bucket.terraform_s3.acl
  
}


output "aws_s3_bucket_tags" {
    value = aws_s3_bucket.terraform_s3.tags
  
}