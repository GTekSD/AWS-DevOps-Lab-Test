
provider "aws" {
  access_key = "AKIA3A23DESMYCEG4DVU"
  secret_key = "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"
  region = "ap-south-1"
}

resource "aws_instance" "Debian11" {
  ami           = "ami-079b117c1800d30f8"
  instance_type = "t2.micro"
}

