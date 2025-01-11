# Output the CloudFront distribution domain name
output "route53_zone_id" {
  value = aws_route53_zone.website_zone.zone_id
}