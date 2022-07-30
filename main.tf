terraform {
  required_version = "1.2.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

data "aws_vpc" "selected" {
  id = "vpc-905320ed"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
