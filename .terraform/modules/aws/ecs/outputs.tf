output "aws_alb_dns_name" {
  description = "AWS ALB DNS Name"
  value       = aws_lb.alb.dns_name
}

output "aws_alb_zone_id" {
  description = "AWS ALB Zone ID"
  value       = aws_lb.alb.zone_id
}
