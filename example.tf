terraform {
  backend "remote" {
    organization = "Rev-QA"
    workspaces {
      name = "terraform-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

// Can be used with output commands
// ex: terraform output ip will output IP address

output "ami" {
  value = aws_instance.example.ami
}

output "ip" {
  value = aws_eip.ip.public_ip
}

output "test" {
  value = "Testing output"
}