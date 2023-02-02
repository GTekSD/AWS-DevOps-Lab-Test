#script that can be used to create a configuration for ElasticSearch that requires credentials and provides encrypted communication.

provider "aws" {
  region = "us-east-1"
  access_key = "AKIA3A23DECEG4DVU"
  secret_key = "rc4DXkL978/YJF7ZgjHAcsaAaWMNzo78cE"
}

}

resource "aws_elasticsearch_domain" "example" {
  domain_name = "example-elasticsearch"

  elasticsearch_version = "7.9"

  cluster_config {
    instance_type            = "t2.small.elasticsearch"
    instance_count           = 2
    dedicated_master_enabled = false
    zone_awareness_enabled   = false
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  access_policies = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:es:us-east-1:*:domain/example-elasticsearch/*"
    }
  ]
}
POLICY
  
  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  vpc_options {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
    security_group_ids = ["sg-12345678"]
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  cognito_options {
    enabled = true
    user_pool_id = "us-east-1_12345678"
    identity_pool_id = "us-east-1:12345678-1234-1234-1234-123456789012"
    role_arn = "arn:aws:iam::123456789012:role/Cognito_ExampleUnauth_Role"
  }
}
