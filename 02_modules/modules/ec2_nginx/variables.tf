variable "prefix" {
    type = string
    description = "Nombre del usuario"
    default = "fantasma"
}

variable "subnet_id" {
    type = string
    description = "Identificador de la red a la que se asociara"
}

variable "vpc_id" {
    type = string
    description = "Identificador del VPC en el que se creara"
}

variable "ami" {
    type = string
    description = "Identificador de la imagen de acuerdo a la region"
}

variable "tags" {
  description = "Tags para todos los objetos creados"
  type = map(string)
  default = {}
}