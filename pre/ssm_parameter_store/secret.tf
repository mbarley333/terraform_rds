resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_ssm_parameter" "secret" {
  name        = "/devops/database/password/admin"
  description = "The parameter description"
  type        = "SecureString"
  value       = "${random_password.password.result}"

  tags = {
    "Owner"   = "devops"
    "Project" = "aws-rds"
    "Client"  = "internal"
  }
}
