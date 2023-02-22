# Terraform & AWS User Creation

Creating a user with an admin policy on AWS using Terraform.

## How to run

1. Make sure to have [AWS access key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) in `.aws/credentials`, or in the environment variables.

2. Run shell commands from this folder

```Shell
terraform init
terraform plan
terraform apply
```

It will create user named **bob** in your AWS account.
