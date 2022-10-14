locals {
  region = ""
  prefix = "dev"
  entorno = "desarrollo"
  tags = {
    "entorno" = "desarrollo"
    "IaC" = "Terraform"
    "Owner" = "Devops"
  }
}

module "vpc" {
source="../../modules/vpc"
vpc_name = local.prefix
vpc_cidr = "10.0.0.0/16"
}
