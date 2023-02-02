# AWS-DevOps-Lab-Test

DevOps Lab Test
Organisation Paktolus
-----------------
You can choose to use any scripting language to automate (great if you could do in Ansible/
Terraform). Use the free-tier resources from AWS. Feel free to comment on your code and/or
put detailed information in the instructions. The exercise will be 2.5 hours.

**## Following is the goals of the exercise:**
1. Demonstrate your hands-on skills, you can code for building cloud hosted solution
2. Demonstrate that you can think of other cross-cutting-concerns like security
3. A nice segue to our discussion after you submit the code

**What we are expecting:**
1. A link to github repo (or a zip/tarball) with code that accomplishes:
- Brings up an AWS instance
- Installs ElasticSearch configured in a way that requires credentials and provides encrypted communication
- Demonstrates that it is functioning

2. Instructions with:
- A short description of your solution describing your choices and why did you make them
- Resources, if any, that you consulted to arrive at the final solution
- How long did you spend on the exercise, and if possible, short feedback about the exercise

3. Must use AWS free tier, however, if you’re using any additional services, please mention them in the instructions

4. ElasticSearch access and communication must be secure

**Bonus:** if you extend your code to create a cluster of 3 ElasticSearch nodes.


====================================
# User Manual

## Elasticsearch.tf manual

Elasticsearch.tf is a Terraform configuration file that creates an Amazon Elasticsearch domain and its associated resources in the AWS environment. 
The following steps will guide you through the process of creating an Elasticsearch domain using Terraform.

### Prerequisites:

Terraform installed on your local machine
AWS account with required permissions to create Elasticsearch domain and associated resources
Access key and secret key of your AWS account
Step 1: Clone or create a new Terraform configuration file with the name Elasticsearch.tf.

Step 2: Edit the file to include the AWS provider block, where you specify the AWS credentials and region to be used for the creation of resources.

Step 3: Add the resource block to create an Amazon Elasticsearch domain. You need to specify the following in the resource block:

Domain name
Elasticsearch version
Cluster configuration
EBS options
Access policies
Snapshot options
VPC options
Advanced options
Cognito options
Step 4: Run the following command in the terminal to initialize the Terraform environment and download the required plugins:

csharp
Copy code
terraform init
Step 5: Verify the Terraform plan with the following command:

Copy code
terraform plan
Step 6: If the plan looks good, apply the changes with the following command:

Copy code
terraform apply
Step 7: After the apply command has completed successfully, you can access the Elasticsearch domain in your AWS environment.

Note: You can use the Terraform state file to manage and update the resources in the future.

## EC2_instance.tf manual

EC2_instance.tf is a Terraform configuration file that creates an Amazon EC2 instance in the AWS environment. The following steps will guide you through the process of creating an EC2 instance using Terraform.

### Prerequisites:

Terraform installed on your local machine
AWS account with required permissions to create EC2 instances
Access key and secret key of your AWS account
Step 1: Clone or create a new Terraform configuration file with the name EC2_instance.tf.

Step 2: Edit the file to include the AWS provider block, where you specify the AWS credentials and region to be used for the creation of resources.

Step 3: Add the resource block to create an Amazon EC2 instance. You need to specify the following in the resource block:

Amazon Machine Image (AMI) ID
Instance type
Step 4: Run the following command in the terminal to initialize the Terraform environment and download the required plugins:

csharp
Copy code
terraform init
Step 5: Verify the Terraform plan with the following command:

Copy code
terraform plan
Step 6: If the plan looks good, apply the changes with the following command:

Copy code
terraform apply
Step 7: After the apply command has completed successfully, you can access the EC2 instance in your AWS environment.

Note: You can use the Terraform state file to manage and update the resources in the future.

====================================


# Refrences:
- https://cloud-images.ubuntu.com/locator/ec2/
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs
