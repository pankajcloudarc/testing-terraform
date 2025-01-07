terraform {
  required_version = ">= 1.5.0" # Specify the required Terraform version

  required_providers {
    aws = {
      source  = "hashicorp/aws"  # Specify the provider source
      version = "~> 4.0"         # Specify the desired version of the AWS provider
    }
  }
}

provider "aws" {
region = var.aws_region # AWS region to deploy resources

default_tags {
tags = {
Environment = "Staging"
}
}
}
