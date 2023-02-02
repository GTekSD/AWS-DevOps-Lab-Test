# This script is using Terraform to create a configuration for an Amazon Web Services (AWS) Elasticsearch domain. The script sets the provider to AWS, providing the access key and secret key for authentication.

provider "aws" {
  region = "us-east-1" # Specifies the AWS region
  access_key = "AKIA3A23DECEG4DVU" # Access key for AWS authentication
  secret_key = "rc4DXkL978/YJF7ZgjHAcsaAaWMNzo78cE" # Secret key for AWS authentication
}

# Resource block creates an Elasticsearch domain in AWS
resource "aws_elasticsearch_domain" "example" {
  domain_name = "example-elasticsearch" # The name of the Elasticsearch domain

  elasticsearch_version = "7.9" # The version of Elasticsearch to use

  # Configuration for the Elasticsearch cluster
  cluster_config {
    instance_type            = "t2.small.elasticsearch" # Type of instances to use in the cluster
    instance_count           = 2 # Number of instances in the cluster
    dedicated_master_enabled = false # Disable dedicated master nodes
    zone_awareness_enabled   = false # Disable zone awareness
  }

  # Configuration for EBS (Elastic Block Storage)
  ebs_options {
    ebs_enabled = true # Enable EBS
    volume_size = 10 # Size of the EBS volume in GB
  }

  # Access policies for the Elasticsearch domain
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
  
  # Configuration for automated snapshots
  snapshot_options {
    automated_snapshot_start_hour = 23 # Hour at which snapshots are taken
  }

  # Configuration for the VPC (Virtual Private Cloud)
  vpc_options {
    subnet_ids = ["subnet-12345678", "subnet-87654321"] # IDs of the subnets in the VPC
    security_group_ids = ["sg-12345678"] # IDs of the security groups in the VPC
  }

  # Advanced configuration options for the Elasticsearch domain
  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  # Configuration for Cognito authentication
  cognito_options {
    enabled = true # Enable Cognito authentication
    user_pool_id = "us-east-1_12345678" # ID of the Cognito user pool
    identity_pool_id = "us-east-1:12345678-1234-1234-1234-123456789012" # ID of the Cognito identity pool
    role_arn = "arn:aws:iam::123456789012:role/Cognito_ExampleUnauth_Role" # ARN of the Cognito unauthenticated role
  }
}
