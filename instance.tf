resource "aws_instance" "web1" {
  ami           = "ami-0583d8c7a9c35822c"
  instance_type = "t2.micro"
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name      = "TF Cloud Instance"
  }
}
