output "vpc_id" {
  description = "Identificado del VPC"
  value = aws_vpc.devopsdays.id
}
output "vpc_red_publica_id" {
  description="Identificador de la red publica"
  value = aws_subnet.public.id
}