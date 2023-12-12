provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION_ID
}

resource "aws_security_group" "pchm_sec_policy" {
  name        = "my-security-group"
  description = "Allow SSH and port 5000"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "my_pchm" {
  key_name   = "my_pchm"
  public_key = file(var.AWS_PCHM_KEY_PATH)
}

resource "aws_instance" "Dummy_instance" {
  ami                    = var.AWS_AMI_ID
  instance_type          = var.AWS_INSTANCE_TYPE
  key_name               = aws_key_pair.my_pchm.key_name
  vpc_security_group_ids = [aws_security_group.pchm_sec_policy.id]
  tags = {
    Name = "server-1-test"
  }
}

output "instance_ip" {
  value = aws_instance.Dummy_instance.public_ip
}
