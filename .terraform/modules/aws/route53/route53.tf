resource "aws_route53_record" "example_record" {
  zone_id = var.aws_route53_record_zone_id
  name    = var.aws_route53_record_name
  type    = var.aws_route53_record_type
  ttl     = var.aws_route53_record_ttl

  alias {
    name                   = var.aws_route53_record_alb_dns_name
    zone_id                = var.aws_route53_record_alb_zone_id
    evaluate_target_health = false
  }
}
