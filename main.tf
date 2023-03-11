terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "test"{
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  user_data = file("${path.module}/weby.sh")
}

