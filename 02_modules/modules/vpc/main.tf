# Create a VPC
resource "aws_vpc" "devopsdays" {
  cidr_block = var.vpc_cidr #cidr asinado
  tags = {
    "Name" = "taller-${var.vpc_name}",
    "IaC"  = "Terraform"
  }
}

resource "aws_internet_gateway" "devopsdays" {
  vpc_id = aws_vpc.devopsdays.id
    tags = merge(
    { "Name" = var.vpc_name },
    var.tags,
  )
}

resource "aws_route_table" "devopsdays" {
  vpc_id = aws_vpc.devopsdays.id
  tags = merge(
    {
      "Name" = format("${var.name}-private-%s", element(var.availability_zones, count.index))
    },
    var.tags,
  )
}