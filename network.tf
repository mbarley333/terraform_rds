# ------------------------------------------------------------------------------
# define the subnets
# ------------------------------------------------------------------------------
resource "aws_subnet" "rds-subnet-1" {
  vpc_id     = data.aws_vpc.devops.id
  cidr_block = "10.0.8.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "rds-subnet-2" {
  vpc_id     = data.aws_vpc.devops.id
  cidr_block = "10.0.9.0/24"
  availability_zone = "us-east-1b" 
}

