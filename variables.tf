variable "virginia_gustavo_vpc" {
  description = "CIDR Virginia Gustavo"
  # type        = map(string) # Ejemplo de workspace.
  type = string
}

# variable "public_subnet_cplx" {
#   description = "CIDR public subnet"
#   type        = string
# }

# variable "private_subnet_cplx" {
#   description = "CIDR private subnet"
#   type        = string
# }

variable "subnets_lista" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags_subnets" {
  description = "Tags para las subnets del proyecto"
  type        = map(string)
}

variable "direccion_ip_gustavo" {
  description = "Dirección IP de Gustavo"
  type        = string
  sensitive   = true
}

variable "especificaciones_ec2_gustavo_virginia" {
  description = "Esta es la AMI de mi primera instancia en Virginia"
  type        = list(string)
}


variable "instancias" {
  description = "Nombre de las instancias"
  type        = set(string)
}

variable "instancia_monitoreo" {
  description = "Instancia de monitoreo"
  type        = number
}

variable "tags_locales" {
  description = "Valores locales para las etiquetas"
  type        = map(string)
}

variable "tags_ejemplo_gustavo" {
  description = "Valores para s3"
  type        = map(string)
}

variable "dynamic_gustavo" {
  description = "Valores para dynamic ingress"
  type        = list(number)
}
