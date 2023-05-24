resource "aws_lb" "alb" {
  name               = "${var.aws_ecs_service_name}-alb"
  load_balancer_type = "application"
  subnets            = var.aws_ecs_service_subnets
  security_groups    = var.aws_ecs_service_security_groups
}

resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.aws_ecs_service_name}-tg"
  port        = var.aws_ecs_task_definition_contianer_port
  protocol    = "HTTP"
  vpc_id      = var.aws_vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "alb_listener_HTTP" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_listener" "alb_listener_HTTPS" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.aws_alb_listener_HTTPS_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "alb_listener_attachment" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_ecs_service.ecs_service.id
  port             = var.aws_ecs_task_definition_contianer_port
}
