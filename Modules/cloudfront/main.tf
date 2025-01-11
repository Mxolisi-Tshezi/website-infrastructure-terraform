
# Create a CloudFront distribution for the website
resource "aws_cloudfront_distribution" "website_distribution" {
  origin {
    domain_name = var.s3_website_endpoint
    origin_id   = "s3-origin"

    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  enabled         = true
  is_ipv6_enabled = true
  comment         = "Website CloudFront Distribution"
  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }

  aliases = ["gita.wealthonwheels.co.za"] # Set the custom domain alias
}

# Update your DNS records to point to the CloudFront distribution
resource "aws_route53_record" "cloudfront_dns" {
  zone_id = var.route53_zone_id # Replace with your Route 53 Zone ID
  name    = "gita.wealthonwheels.co.za"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.website_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.website_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}