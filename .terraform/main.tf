terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = local.aws_region
}

module "ecr" {
  source = "./modules/aws/ecr"

  aws_ecr_name = local.aws_ecr_name
}

# module "ecs" {
#   source = "./modules/aws/ecs"

#   aws_region = local.aws_region
#   aws_vpc_id = aws_default_vpc.default_vpc.id

#   aws_ecs_cluster_name = local.aws_ecs_cluster_name

#   aws_ecs_task_definition_name           = local.aws_ecs_task_definition_name
#   aws_ecs_task_definition_family         = local.aws_ecs_task_definition_family
#   aws_ecs_task_definition_image          = "${module.ecr.ecr_repository_url}:latest"
#   aws_ecs_task_definition_cpu            = local.aws_ecs_task_definition_cpu
#   aws_ecs_task_definition_memory         = local.aws_ecs_task_definition_memory
#   aws_ecs_task_definition_contianer_port = local.aws_ecs_task_definition_contianer_port
#   aws_ecs_task_definition_host_port      = local.aws_ecs_task_definition_host_port

#   aws_ecs_service_name            = local.aws_ecs_service_name
#   aws_ecs_service_desired_count   = local.aws_ecs_service_desired_count
#   aws_ecs_service_subnets         = ["${aws_default_subnet.default_subnet_1.id}", "${aws_default_subnet.default_subnet_2.id}", "${aws_default_subnet.default_subnet_3.id}"]
#   aws_ecs_service_security_groups = ["${aws_security_group.open_security_group.id}"]
# }

# module "route53_root" {
#   source = "./modules/aws/route53"

#   aws_route53_record_alb_zone_id  = module.ecs.aws_alb_zone_id
#   aws_route53_record_alb_dns_name = module.ecs.aws_alb_dns_name
#   aws_route53_record_zone_id      = data.aws_route53_zone.route53_zone
#   aws_route53_record_name         = local.aws_route53_record_name_root
#   aws_route53_record_type         = local.aws_route53_record_type_root
#   aws_route53_record_ttl          = local.aws_route53_record_ttl_root
# }

# module "route53_www" {
#   source = "./modules/aws/route53"

#   aws_route53_record_alb_zone_id  = module.ecs.aws_alb_zone_id
#   aws_route53_record_alb_dns_name = module.ecs.aws_alb_dns_name
#   aws_route53_record_zone_id      = data.aws_route53_zone.route53_zone
#   aws_route53_record_name         = local.aws_route53_record_name_www
#   aws_route53_record_type         = local.aws_route53_record_type_www
#   aws_route53_record_ttl          = local.aws_route53_record_ttl_www
# }
