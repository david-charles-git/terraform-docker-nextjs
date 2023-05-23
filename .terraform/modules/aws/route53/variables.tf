variable "aws_route53_record_zone_id" {
  description = "AWS Route 53 Record Zone ID"
  type        = string
}

variable "aws_route53_record_name" {
  description = "AWS Route 53 Record Name"
  type        = string
}

variable "aws_route53_record_type" {
  description = "AWS Route 53 Record Type"
  type        = string
  default     = "A"
}

variable "aws_route53_record_ttl" {
  description = "AWS Route 53 Record TTL"
  type        = string
  default     = "300"
}

variable "aws_route53_record_alb_dns_name" {
  description = "AWS Route 53 Record ALB DNS Name"
  type        = string
}

variable "aws_route53_record_alb_zone_id" {
  description = "AWS Route 53 Record ALB Zone ID"
  type        = string
}
