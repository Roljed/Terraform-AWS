provider "aws" {
  region = "us-east-1"
  # access_key = in .aws/config/credentials
  # secret_key = in .aws/config/credentials
}

resource "aws_iam_user" "admin-user" {
  name = "bob"
  tags = {
    Description = "Technical Team Leader"
  }
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}

resource "aws_iam_user" "users" {
  name  = var.project-sapphire-users[count.index]
  count = length(var.project-sapphire-users)
}
