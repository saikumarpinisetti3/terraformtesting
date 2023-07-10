resource "aws_s3_bucket" "devops" {
  bucket = var.bucket_name

  tags = var.tags
}

