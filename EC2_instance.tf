# This script is using Terraform to creates an Amazon Web Services (AWS) virtual machine (EC2 instance)

provider "aws" {
  # AWS Access Key
  access_key = "AKIA3A23DESMYCEG4DVU"
  # AWS Secret Key
  secret_key = "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"
  # AWS region where the resources will be created
  region = "ap-south-1"
}

# Resource block to create an AWS EC2 instance
resource "aws_instance" "Debian11" {
  # ID of the Amazon Machine Image (AMI) used to launch the instance
  ami           = "ami-079b117c1800d30f8"
  # Type of instance to launch
  instance_type = "t2.micro"
}
