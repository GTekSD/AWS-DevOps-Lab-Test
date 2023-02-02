#script to create an AWS instance as well as an ElasticSearch configuration
""" To make the script in the example work, you need to replace the placeholders in the access policies and cognitooptions sections with your own credentials and access information. Additionally, you will need to update the subnetids and securitygroupids fields with the IDs of your own subnets and security groups. Finally, you will need to update the volumesize and automatedsnapshotstarthour fields with values that fit your needs. """

provider "aws" {
  access_key = "AKIA3A23DESMYCEG4DVU"
  secret_key = "rc4DXkL97KBc8/YnD3JF7ZgjHAcsaAaWMNzo78cE"
  region = "ap-south-1"
}

resource "aws_instance" "Debian11" {
  ami           = "ami-079b117c1800d30f8"
  instance_type = "t2.micro"
}

resource "aws_elasticsearch_domain" "example" {
  domain_name     = "example"
  elasticsearch_version = "7.10"

  cluster_config {
    instance_type            = "m4.large.elasticsearch"
    instance_count           = 3
    dedicated_master_enabled = true
    zone_awareness_enabled   = true
  }

  access_policies = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "es:*",
      "Resource": "arn:aws:es:us-east-1:111122223333:domain/example/*"
    }
  ]
}
POLICY

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
    "http.cors.enabled"                     = "true"
    "http.cors.allow-origin"                = "*"
  }

  domain_endpoint_options {
    enforce_https = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }
}
