# Create an ACM certificate for HTTPS
resource "aws_acm_certificate" "website_certificate" {
  domain_name       = var.domain_name # Replace with your domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true 
  }
}

resource "aws_route53_record" "acm_certificate_validation" {
    count = length(aws_acm_certificate.website_certificate[*].domain_validation_options)

  allow_overwrite = true
  name =  tolist(aws_acm_certificate.website_certificate.domain_validation_options)[0].resource_record_name
  records = [tolist(aws_acm_certificate.website_certificate.domain_validation_options)[0].resource_record_value]
  type = tolist(aws_acm_certificate.website_certificate.domain_validation_options)[0].resource_record_type
  zone_id =var.route53_zone_id
  ttl =300
}