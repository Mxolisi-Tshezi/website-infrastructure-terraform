output "s3_bucket_domain_name" {
  value = data.aws_s3_bucket.existing_static_website.bucket_domain_name
}
output "s3_website_endpoint" {
  value = data.aws_s3_bucket.existing_static_website.website_endpoint
}
