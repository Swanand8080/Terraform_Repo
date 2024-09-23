resource "aws_security_group" "vpc-web" {
  name        = "vpc-web-sg-1"
  # vpc_id      = aws_vpc.vpc.id
  description = "Web Traffic"
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
   create_before_destroy = true
  }
  }

resource "aws_instance" "web" {
  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.vpc-web.id]
}
