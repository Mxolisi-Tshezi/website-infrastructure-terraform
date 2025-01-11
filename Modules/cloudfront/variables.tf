variable "route53_zone_id" {
  description = "This stores the route53 id"
  type        = string

}

variable "acm_certificate_arn" {
  description = "This stores the certificate arn"
  type        = string

}

variable "s3_website_endpoint" {
  description = "This stores the static website"
  type        = string

}
