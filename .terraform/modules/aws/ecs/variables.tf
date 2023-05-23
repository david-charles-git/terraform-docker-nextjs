variable "aws_ecs_cluster_name" {
  description = "AWS ECS Cluster Name"
  type        = string
}

variable "aws_ecs_task_definition_family" {
  description = "AWS ECS Task Definiion Family"
  type        = string
}

variable "aws_ecs_task_definition_cpu" {
  description = "AWS ECS Task Definiion CPU"
  type        = string
  default     = "256"
}

variable "aws_ecs_task_definition_memory" {
  description = "AWS ECS Task Definiion Memory"
  type        = string
  default     = "512"
}

variable "aws_ecs_task_definition_name" {
  description = "AWS ECS Task Definiion Name"
  type        = string
}

variable "aws_ecs_task_definition_image" {
  description = "AWS ECS Task Definiion Image"
  type        = string
}

variable "aws_ecs_task_definition_contianer_port" {
  description = "AWS ECS Task Definiion Contianer Port"
  type        = number
  default     = 80
}

variable "aws_ecs_task_definition_host_port" {
  description = "AWS ECS Task Definiion Host Port"
  type        = number
  default     = 80
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "aws_vpc_id" {
  description = "AWS VPC ID"
  type        = string
}

variable "aws_ecs_service_name" {
  description = "AWS ECS Service Name"
  type        = string
}

variable "aws_ecs_service_desired_count" {
  description = "AWS ECS Service Desired Count"
  type        = number
  default     = 1
}

variable "aws_ecs_service_subnets" {
  description = "AWS ECS Service Subnets"
  type        = list(string)
}

variable "aws_ecs_service_security_groups" {
  description = "AWS ECS Service Security Groups"
  type        = list(string)
}

variable "aws_alb_listener_port" {
  description = "AWS Application Load Balancer Listener Port"
  type        = number
  default     = 80
}
