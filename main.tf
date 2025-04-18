terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance1" {
        ami = "ami-0c15e602d3d6c6c4a"
        instance_type = "t2.micro"
        availability_zone = "us-east-1a"
        key_name = "Swanand_Terraform_key"
        tags = {
                Name = "Created-using-vcs"
}
}
