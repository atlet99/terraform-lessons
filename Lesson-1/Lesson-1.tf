provider "aws" {
    access_key = "gfdgf"
    secret_key = "fsdfdsjfhs"
    region =  "eu-central-1"
}

resource "aws_instance" "my_Ubuntu" {
  ami = "ami-0432nfjs432"
  instance_type = "t3.micro"
}