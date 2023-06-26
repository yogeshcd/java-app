terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  access_key=var.AWS_ACCESS_KEY
  secret_key=var.AWS_SECRET_ACCESS_KEY
  region = "us-east-1"
}
