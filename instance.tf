resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  tags = {
    Name = "allow_tls"
  }
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
}
resource "aws_instance" "web1" {
  ami           = "ami-0583d8c7a9c35822c"
  instance_type = "t2.micro"
  security_group = [aws_security_group.allow_tls.id]
  
    tags = {
    Name      = "TF Cloud Instance"
  }
}
