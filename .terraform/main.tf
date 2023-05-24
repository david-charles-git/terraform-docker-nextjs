terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

module "ecr" {
  source = "./modules/aws/ecr"

  aws_ecr_name = local.aws_ecr_name
}

module "ecs" {
  source = "./modules/aws/ecs"

  aws_region = local.aws_region
  aws_vpc_id = aws_default_vpc.default_vpc.id

  aws_ecs_cluster_name = local.aws_ecs_cluster_name

  aws_ecs_task_definition_name           = local.aws_ecs_task_definition_name
  aws_ecs_task_definition_family         = local.aws_ecs_task_definition_family
  aws_ecs_task_definition_image          = module.ecr.ecr_repository_url
  aws_ecs_task_definition_cpu            = local.aws_ecs_task_definition_cpu
  aws_ecs_task_definition_memory         = local.aws_ecs_task_definition_memory
  aws_ecs_task_definition_contianer_port = local.aws_ecs_task_definition_contianer_port
  aws_ecs_task_definition_host_port      = local.aws_ecs_task_definition_host_port

  aws_ecs_service_name            = local.aws_ecs_service_name
  aws_ecs_service_desired_count   = local.aws_ecs_service_desired_count
  aws_ecs_service_subnets         = ["${aws_default_subnet.default_subnet_1.id}", "${aws_default_subnet.default_subnet_2.id}", "${aws_default_subnet.default_subnet_3.id}"]
  aws_ecs_service_security_groups = ["${aws_security_group.open_security_group.id}"]

  aws_alb_listener_HTTPS_certificate_arn = data.aws_acm_certificate.ssl_certificate.arn
}

module "route53_root" {
  source = "./modules/aws/route53"

  aws_route53_record_alb_zone_id  = module.ecs.aws_alb_zone_id
  aws_route53_record_alb_dns_name = module.ecs.aws_alb_dns_name
  aws_route53_record_zone_id      = data.aws_route53_zone.route53_zone.id
  aws_route53_record_name         = local.aws_route53_record_name_root
  aws_route53_record_type         = local.aws_route53_record_type_root
}

module "route53_www" {
  source = "./modules/aws/route53"

  aws_route53_record_alb_zone_id  = module.ecs.aws_alb_zone_id
  aws_route53_record_alb_dns_name = module.ecs.aws_alb_dns_name
  aws_route53_record_zone_id      = data.aws_route53_zone.route53_zone.id
  aws_route53_record_name         = local.aws_route53_record_name_www
  aws_route53_record_type         = local.aws_route53_record_type_www
}

# resource "aws_internet_gateway" "internet_gateway" {
#   vpc_id = aws_default_vpc.default_vpc.id
# }

# resource "aws_route_table" "route_table" {
#   vpc_id = aws_default_vpc.default_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.internet_gateway.id
#   }

#   route {
#     ipv6_cidr_block = "::/0"
#     gateway_id      = aws_internet_gateway.internet_gateway.id
#   }
# }

# resource "aws_route_table_association" "route_table_association_1" {
#   route_table_id = aws_route_table.route_table.id
#   subnet_id      = aws_default_subnet.default_subnet_1.id
# }

# resource "aws_route_table_association" "route_table_association_2" {
#   route_table_id = aws_route_table.route_table.id
#   subnet_id      = aws_default_subnet.default_subnet_2.id
# }

# resource "aws_route_table_association" "route_table_association_3" {
#   route_table_id = aws_route_table.route_table.id
#   subnet_id      = aws_default_subnet.default_subnet_3.id
# }
