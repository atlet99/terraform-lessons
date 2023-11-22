provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION_ID
}

resource "aws_instance" "Dummy_instance" {
  ami           = var.AWS_AMI_ID
  instance_type = var.AWS_INSTANCE_TYPE
  tags = {
    Name = "server-1-test"
  }
}
