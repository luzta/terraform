
provider "aws" {
  region = "us-east-1" #region asignada
}

# Create a VPC
resource "aws_vpc" "lcanqui" {
  cidr_block = "10.0.0.0/16" #cidr asinado
  tags = {
    "Name" = "taller-lcanqui",
    "IaC"  = "Terraform"
  }

}