# -----------------------------------------------------------------------------
# items not likely to change much
# -----------------------------------------------------------------------------
variable "aws_region" {
  default = "us-east-1"
}

variable "aws_account_id" {
}


variable "db_user" {
  default = "admin"
}


variable "db_port" {
  default = 1433
}

variable "project_name" {
  default = "aws-rds"
}

variable "rds_properties" {
  type = map(string)

  default = {
    "instance_class"    = "db.t3.large"
    "storage_type"      = "io1"
    "iops"              = 1000
    "engine"            = "sqlserver-ex"
    "engine_version"    = "15.00.4198.2.v1"
    "license_model"     = "license-included"
    "multi_az"          = false
    "storage_encrypted" = false
  }
}

# -----------------------------------------------------------------------------
# items that may change
# -----------------------------------------------------------------------------
variable "tags" {
  type = map(string)

  default = {
    "Owner"   = "devops"
    "Project" = "aws-rds"
    "Client"  = "internal"
  }
}

