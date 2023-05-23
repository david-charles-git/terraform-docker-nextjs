resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_subnet_1" {
  availability_zone = "eu-west-1a"
}

resource "aws_default_subnet" "default_subnet_2" {
  availability_zone = "eu-west-1b"
}

resource "aws_default_subnet" "default_subnet_3" {
  availability_zone = "eu-west-1c"
}

resource "aws_security_group" "open_security_group" {
  name        = "OpenSecurityGroup"
  description = "Open security group allowing all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
