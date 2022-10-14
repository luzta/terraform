variable "vpc_cidr" {
    description = "Segmento de Red para la VPC"
    type = string
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type = string 
  default = "fantasma"
}

variable "tags" {
  description = "Tags para todos los objetos creados"
  type = map(string)
  default = {}
}

variable "cidr_public_subnet" {
  description = "Cidr para la red publica"
  type = string
}