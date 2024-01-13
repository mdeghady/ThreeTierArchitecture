variable "region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-east-1"

}

variable "vpc_cidar" {

  type        = string
  description = "VPC cidar block"
  default     = "10.0.0.0/16"

}



variable "private_subnets" {
  type        = list(string)
  description = "VPC private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}
variable "public_subnets" {
  type        = list(string)
  description = "VPC public subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]

}

variable "db_subnets" {
  type        = list(string)
  description = "VPC databse subnets"
  default     = ["10.0.5.0/24", "10.0.6.0/24"]

}

variable "project_tags" {
  type        = map(string)
  description = "project tags to be used by all resources"
  default = {
    "terraform"   = "true"
    "project"     = "Three Tier Architecture"
    "environment" = "dev"
  }

}
