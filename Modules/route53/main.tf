# Create a Route 53 hosted zone and DNS records for ACM certificate validation
resource "aws_route53_zone" "website_zone" {
  name =var.Hosted_zone
}

