terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.78"
    }
  }
  required_version = ">= 1.10.0"
}

resource "aws_vpc" "terraform_project_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-project-vpc"
  }
}

resource "aws_subnet" "terraform_project_subnet" {
  vpc_id                  = aws_vpc.terraform_project_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "terraform-project-subnet"
  }
}

resource "aws_security_group" "terraform_project_sg" {
  name        = "terraform-project-sg"
  vpc_id      = aws_vpc.terraform_project_vpc.id
  description = "Allow HTTP, HTTPS, and SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-project-sg"
  }
}

resource "aws_instance" "terraform_project_instance" {
  ami                    = var.ami_id # Replace with correct AMI ID
  instance_type          = var.instance_type
  key_name = var.key_name /* existing key */
  subnet_id              = aws_subnet.terraform_project_subnet.id
  vpc_security_group_ids = [aws_security_group.terraform_project_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "terraform-project-instance"
  }
}
