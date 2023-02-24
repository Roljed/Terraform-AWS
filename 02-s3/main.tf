resource "aws_s3_bucket" "finance" {
  bucket = "some-bucket-name"
  tags = {
    Description = "Finance and Payroll"
  }
}

resource "aws_s3_bucket_object" "finance-2023" {
  content = "finance-file.txt"
  key     = "finance-2023.doc"
  bucket  = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
  group_name = "finance-analysis"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}/*",
            "Principal": {
                "AWS": [
                    "${data.aws_iam_group.finance-data.arn}"
                ]
            }
        }
    ]
  }
  EOF
}

# Image upload
resource "aws_s3_object" "upload" {
  bucket = "pixar-studios-2020"
  key    = "woody.jpg"
  source = "/root/woody.jpg"
}
