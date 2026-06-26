terraform {
  backend "s3" {
    bucket         = "employee-platform-tfstate-dev"
    key            = "dev/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "employee-platform-tf-lock-dev"
    encrypt        = true
  }
}
