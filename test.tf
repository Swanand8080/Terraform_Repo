provider "aws" {
  region = "us-west-2"
  alias  = "primary"
}

provider "aws" {
  region = "us-east-1"
  alias  = "secondary"
}

resource "aws_instance" "example_primary" {
  provider      = aws.primary
  ami           = "ami-0e86e20dae9224db8"  # Example AMI
  instance_type = "t2.micro"
}

resource "aws_instance" "example_secondary" {
  provider      = aws.secondary
  ami           = "ami-0e86e20dae9224db8"  # Example AMI
  instance_type = "t2.micro"
}
