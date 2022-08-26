# ------------------------------------------------------------------------------
# security group constraining access to RDS instance
# ------------------------------------------------------------------------------

resource "aws_security_group" "rds" {
  vpc_id      = data.aws_vpc.devops.id
  name_prefix = var.project_name
  description = "allow TSQL"

  tags = merge(
    {
      "Name" = "${var.project_name}-tsql"
    },
    var.tags,
  )

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = concat([data.aws_vpc.devops.cidr_block])
  }
}

resource "aws_db_subnet_group" "rds" {
  name_prefix = var.project_name
  subnet_ids  = [aws_subnet.rds-subnet-1.id,aws_subnet.rds-subnet-2.id]
  description = "RDS Subnets"
  tags        = var.tags
}

resource "aws_db_instance" "rds" {
  depends_on = [aws_db_subnet_group.rds]

  identifier_prefix           = var.project_name
  license_model               = var.rds_properties["license_model"]
  storage_type                = var.rds_properties["storage_type"]
  iops                        = var.rds_properties["iops"]
  engine                      = var.rds_properties["engine"]
  engine_version              = var.rds_properties["engine_version"]
  instance_class              = var.rds_properties["instance_class"]
  multi_az                    = var.rds_properties["multi_az"]
  storage_encrypted           = var.rds_properties["storage_encrypted"]
  username                    = var.db_user
  password                    = data.aws_ssm_parameter.dbpassword.value
  port                        = var.db_port
  allocated_storage           = 20
  max_allocated_storage       = 100
  backup_retention_period     = 3
  skip_final_snapshot         = true
  allow_major_version_upgrade = false
  apply_immediately           = true
  copy_tags_to_snapshot       = true
  publicly_accessible         = true
  vpc_security_group_ids      = [aws_security_group.rds.id]
  db_subnet_group_name        = aws_db_subnet_group.rds.id

  tags = merge(
    {
      "Name" = var.project_name
    },
    var.tags,
  )
}

