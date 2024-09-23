terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

provider "aws" {
        region     = "us-east-1"
}
resource "aws_ebs_volume" "myvolume" {
  availability_zone = "us-east-1a"
  size              = 60

  tags = {
    Name = "CreatedUsingTerraform"
  }
}
