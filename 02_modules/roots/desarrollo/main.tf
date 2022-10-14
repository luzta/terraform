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
cidr_public_subnet = "10.0.100.0/24"
}

module "nginx" {
  source = "../../modules/ec2_nginx"
  ami = "ami-04ca1c16432746673"
  prefix = local.prefix
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.vpc_red_publica_id
  tags=local.tags
}
