provider "aws" {
  region = "us-east-1"
  access_key = "AKIARO26PKTEWRW6WFDP"
  secret_key = "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"
}

resource "aws_instance" "web_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name      = "terraformkp"

  tags = {
    Name = "Jenkins-Terraform-Server"
  }
}

output "server_ip" {
  value = aws_instance.web_server.public_ip
}

