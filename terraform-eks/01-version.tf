terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
    backend "s3" {
    bucket = "somerandommybucket"
    key    = "fullinfra"
    region = "us-east-1"
  }

}

# Configure the AWS Provider
provider "aws" {
  access_key=var.AWS_ACCESS_KEY
  secret_key=var.AWS_SECRET_ACCESS_KEY
  region = "us-east-1"
}
