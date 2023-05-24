data "aws_route53_zone" "route53_zone" {
  name = "project9.link"
}

data "aws_acm_certificate" "ssl_certificate" {
  domain   = "project9.link"
  statuses = ["ISSUED"]
}
