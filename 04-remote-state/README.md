# Terraform Remote State

Running `Terraform init` will initialize the backend to be used, which in this case it is the AWS S3 bucket.

Then, we can delete the local `terraform.tfstate` file. When we run `Terraform plan` or `Terraform apply` will pull the state file from our remote location - AWS S3 and any change to the state file will be uploaded to our backend immediately, and it will not be stored in our local directory.
