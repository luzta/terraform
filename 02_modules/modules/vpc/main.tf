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
    { "Name" = "${var.vpc_name}"},
    var.tags
  )
  depends_on = [
    aws_vpc.devopsdays
  ]
}

resource "aws_route_table" "publica" {
  vpc_id = aws_vpc.devopsdays.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devopsdays.id
  }
  tags = merge(
    {
      "Name" = "${var.vpc_name}-publica"
    },
    var.tags,
  )
  depends_on = [
    aws_internet_gateway.devopsdays
  ]
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.devopsdays.id
  cidr_block = var.cidr_public_subnet
  
  tags = {
    Name = "Red-publica"
  }
  depends_on = [
    aws_route_table.publica
  ]
}

resource "aws_route_table_association" "publica" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.publica.id
  depends_on = [
    aws_subnet.public,aws_route_table.publica
  ]
}
