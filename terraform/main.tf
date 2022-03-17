
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

locals {
  module_common_tags = merge(var.common_tags, {
    ManagedBy = "Terraform"
  })
}

data aws_region current {
  name = var.region_name
}

data aws_availability_zones zones {
  state = "available"
}
