variable "domain_name" {
  type        = string
  default     = "example.com"
  description = "Domain name for the website"
}

variable "route53_zone_id" {
  description = "This stores the route53 id"
  type        = string

}