resource "aws_ecr_repository" "ecr" {
  name         = var.aws_ecr_name
  force_delete = true
}
