output "aws_ecr_respoitory_url" {
  value = module.ecr.ecr_repository_url
}

output "aws_ecs_alb_domain_name" {
  value = module.ecs.aws_alb_dns_name
}

output "aws_domain_root" {
  value = local.aws_route53_record_name_root
}

output "aws_domain_www" {
  value = local.aws_route53_record_name_www
}
