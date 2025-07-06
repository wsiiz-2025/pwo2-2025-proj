provider "aws" {
  profile = "default"
  region  = "us-east-1"
  
  default_tags {
    tags = {
      source = "tf"
    }
  }
}

resource "aws_key_pair" "main" {
  key_name   = "tf-vm-key"
  public_key = var.public_key
}

resource "aws_security_group" "tf_sg" {
  name        = "tf-sg"
  description = "Ports to be open for testing the app"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "tf_ec2" {
  count                  = 1
  ami                    = "ami-007855ac798b5175e"
  instance_type          = "t2.medium"
  key_name               = aws_key_pair.main.key_name
  vpc_security_group_ids = [aws_security_group.tf_sg.id]
  user_data              = file("install_packages.sh")

  root_block_device {
    volume_size = 100  # in GB
    volume_type = "gp3"
    encrypted   = false
  }

  tags = {
    Name = "${format("tf-%d", count.index)}"
  }
}
