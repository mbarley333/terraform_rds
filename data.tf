# -----------------------------------------------------------------------------
# data lookups
# -----------------------------------------------------------------------------
data "aws_vpc" "devops" {
    filter {
        name = "tag:Name"
        values = ["devops"]
    }
} 

data "aws_ssm_parameter" "dbpassword" {
  name = "/devops/database/password/admin"
}
