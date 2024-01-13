##################################################################################
# VPC DATA
##################################################################################

data "aws_availability_zones" "azs" {}



##################################################################################
# VPC MODULE
##################################################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ThreeTier-vpc"
  cidr = var.vpc_cidar

  azs              = slice(data.aws_availability_zones.azs.names, 0, 2)
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.db_subnets

  create_database_subnet_group = true

  tags = var.project_tags

}
