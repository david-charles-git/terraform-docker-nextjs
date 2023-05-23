locals {
  aws_region = "eu-west-1"

  aws_ecr_name = "nextjs-docker"

  aws_ecs_cluster_name = "nextjs-docker-cluster"

  aws_ecs_task_definition_name           = "nextjs-docker-task"
  aws_ecs_task_definition_family         = "nextjs-docker-task-family"
  aws_ecs_task_definition_cpu            = "256"
  aws_ecs_task_definition_memory         = "512"
  aws_ecs_task_definition_contianer_port = 3000
  aws_ecs_task_definition_host_port      = 3000

  aws_ecs_service_name          = "nextjs-docker-service"
  aws_ecs_service_desired_count = 1

  aws_alb_listener_port = 80

  aws_route53_record_name_root = "project9.link"
  aws_route53_record_type_root = "A"
  aws_route53_record_ttl_root  = "300"

  aws_route53_record_name_www = "www.project9.link"
  aws_route53_record_type_www = "A"
  aws_route53_record_ttl_www  = "300"
}
