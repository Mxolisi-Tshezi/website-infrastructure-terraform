data "aws_s3_bucket" "existing_static_website" {
  bucket =var.bucket_name
}
