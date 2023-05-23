resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.aws_ecs_cluster_name
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.aws_ecs_task_definition_family
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.aws_ecs_task_definition_cpu
  memory                   = var.aws_ecs_task_definition_memory

  container_definitions = <<DEFINITION
		[
			{
				"name": "${var.aws_ecs_task_definition_name}",
				"image": "${var.aws_ecs_task_definition_image}",
				"portMappings": [
					{
						"containerPort": ${var.aws_ecs_task_definition_contianer_port},
						"hostPort": ${var.aws_ecs_task_definition_host_port},
						"protocol": "tcp",
						"appProtocol": "http"
					}
				],
				"logConfiguration": {
					"logDriver": "awslogs",
					"options": {
						"awslogs-group": "/ecs/${var.aws_ecs_task_definition_name}",
						"awslogs-create-group": "true",
						"awslogs-region": "${var.aws_region}",
						"awslogs-stream-prefix": "ecs"
					}
				}
			}
		]
  	DEFINITION
}

resource "aws_ecs_service" "ecs_service" {
  name                 = var.aws_ecs_service_name
  cluster              = aws_ecs_cluster.ecs_cluster.id
  task_definition      = aws_ecs_task_definition.task_definition.arn
  desired_count        = var.aws_ecs_service_desired_count
  launch_type          = "FARGATE"
  force_new_deployment = true

  network_configuration {
    subnets          = var.aws_ecs_service_subnets
    security_groups  = var.aws_ecs_service_security_groups
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.alb_target_group.arn
    container_name   = var.aws_ecs_task_definition_name
    container_port   = var.aws_ecs_task_definition_contianer_port
  }
}
