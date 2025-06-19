virginia_gustavo_vpc = "10.10.0.0/16"


# Ejemplo de workspace.
# # virginia_gustavo_vpc = {
# #   "produccion" = "10.10.0.0/16"
# #   "desarrollo" = "172.16.0.0/16"
# # }

# public_subnet_cplx = "10.10.0.0/24"

# private_subnet_cplx = "10.10.1.0/24"

subnets_lista = ["10.10.0.0/24", "10.10.1.0/24"]


tags_subnets = {
  "Empresa"    = "CPLX"
  "IAC"        = "Terraform"
  "Ambiente"   = "PRD"
  "Proyecto"   = "BTS"
  "Creado por" = "Gustavo"
}

direccion_ip_gustavo = "0.0.0.0/0"

especificaciones_ec2_gustavo_virginia = ["ami-0953476d60561c955", "t2.micro"]

instancias = ["apache"]

instancia_monitoreo = 4

tags_locales = {
  "Devops"   = "gustavo"
  "Proyecto" = "factus"
  "Ambiente" = "produccion"
}

tags_ejemplo_gustavo = {
  "Empresa"  = "tpp"
  "Ambiente" = "prd"
  "Proyecto" = "bts"
}

dynamic_gustavo = ["443", "80", "22", "70"]












