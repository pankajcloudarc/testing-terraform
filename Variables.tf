variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "Type of EC2 instance to deploy"
  type        = string
  default     = "t4g.small"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default =  "ami-0c5cf6a79a8c2e3e9"
}


variable "key_name" {
  description = "Name of the existing key pair to access the instance"
  type        = string
  default = "pankaj-key"
}

variable "volume_size" {
  description = "Size of the root volume for the EC2 instance in GB"
  default     = 8
}



variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "ap-south-1a"
}