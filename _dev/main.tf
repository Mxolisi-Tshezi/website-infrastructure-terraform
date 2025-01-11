


# s3
module "s3" {
  source = "../Modules/s3"
}

# route53
module "route53" {
  source = "../Modules/route53"

}

# acm
module "acm" {
  source          = "../Modules/acm"
  route53_zone_id = module.route53.route53_zone_id

}


# cloudfront
module "cloudfront" {
  source              = "../Modules/cloudfront"
  route53_zone_id     = module.route53.route53_zone_id
  acm_certificate_arn = module.acm.website_certificate_arn
  s3_website_endpoint = module.s3.s3_website_endpoint

}
