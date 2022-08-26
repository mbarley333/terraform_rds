terraform {
  backend "s3" {
    bucket         = "<BUCKETNAME>"
    key            = "terraform-aws-rds"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "<KMS_ARN>"
    dynamodb_table = "terraform-state"
  }
}
