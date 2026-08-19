
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "cicd-aws-terraform-testdemo2"
    key    = "Dev/terraform.tfstate"
    region = "us-east-1"
  }

}

# Configure the AWS Provider

provider "aws" {
  region = "us-east-1"
}