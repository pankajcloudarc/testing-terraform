terraform {
  required_providers {
    source  = "hashicorp/aws"
      version = "~> 5.0" # Specify the desired version of the AWS provider
    }
  }

  required_version = ">= 1.5.0" # Specify the required Terraform version


provider "aws" {
region = var.aws_region # AWS region to deploy resources

default_tags {
tags = {
Environment = "Staging"
}
}
}
