# Terraform & AWS S3

Upload files to AWS S3 bucket.

## How to run

1. Make sure to have [AWS access key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) in `.aws/credentials`, or in the environment variables.

2. Give a name to your S3 buckets.

```Terraform
resource "aws_s3_bucket" "finance" {
  bucket = "some-bucket-name"
}
```

3. Run shell commands from this folder

```Shell
terraform init
terraform plan
terraform apply
```

This will upload finance-file.txt and woody.jpg image to your S3 bucket.
