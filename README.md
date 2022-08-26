# Deploy AWS RDS SQL Server into existing VPC
This project deploys AWS RDS SQL Server into an existing VPC, creates a terraform backend with s3 and dynamodb, and pulls in the db password from AWS SSM Parameter Store.  Project is intended only for development and testing purposes.

## NOTE: AWS RDS SQL Server is expensive.  Please don't leave this instance running for long periods.

## Prequisites
* appropriate AWS credentials are available
* terraform is available
* setup terraform backend
* setup SSM Paramater Store entry
 
## setup terraform backend
* step by steps: https://technology.doximity.com/articles/terraform-s3-backend-best-practices
* reference pre/s3_backend for code sample

## setup SSM Paramater Store entry
* reference pre/ssm_parameter_store for code sample



## Usage
 - update `backend.tf` to specify your own Terraform backend
 - check `variables.tf` to see if there are values you want to change
 - apply `terraform init` then `terraform apply`

On successful completion, information is reported that you may need:

```
Outputs:

db_arn = <ARN>
db_endpoint = <ENDPOINT>
db_user = admin
```

## Deploying AWS RDS is slow
It takes a long time for RDS to deploy and show ready.  The terraform may time out waiting for AWS RDS SQL Server w/ multi az to deploy.  However, the RDS instance will show ready in the console even after terraform timeout.  Last attempt took 40+ minutes.


## Credit
Thank you to @LeapBeyond for the excellent code that served as the basis for this project.  For a project that creates a new vpc and deploys aws rds sql server check out: https://github.com/LeapBeyond/terraform-aws-rds

