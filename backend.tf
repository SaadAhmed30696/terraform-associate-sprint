/*terraform {
  backend "s3" {
    bucket = "terraform-remote-0360"
    key    = "home/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true #replacing this for DynamoDB requirement
  }
}*/
