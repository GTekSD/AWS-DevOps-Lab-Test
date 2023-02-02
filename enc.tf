#script that can be used to create a configuration for ElasticSearch that requires credentials and provides encrypted communication.

provider "aws" {
  region = "us-east-1"
}

resource "aws_elasticsearch_domain" "example" {
  domain_name     = "example"
  elasticsearch_version = "7.4"

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
