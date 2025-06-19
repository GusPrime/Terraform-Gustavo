resource "aws_vpc" "virginia_gustavo_vpc_tpp" {
  cidr_block = var.virginia_gustavo_vpc
  # cidr_block = lookup(var.virginia_gustavo_vpc, terraform.workspace) # Ejemplo de workspace.
  tags = {
    Name = "VPC Gustavo TPP-${local.tags_claves}"
  }
}

resource "aws_subnet" "subred_publica" {
  vpc_id                  = aws_vpc.virginia_gustavo_vpc_tpp.id
  cidr_block              = var.subnets_lista[0] # Asigna la primera subred de la lista como pública.
  map_public_ip_on_launch = true                 # asigna IPs públicas a las instancias en esta subred.
  tags = {
    Name = "Subred Pública TPP-${local.tags_claves}"
  }
  # provider = aws.virgi # Asegúrate de que el proveedor esté configurado correctamente para Virginia.
}
resource "aws_subnet" "subred_privada" {
  vpc_id     = aws_vpc.virginia_gustavo_vpc_tpp.id
  cidr_block = var.subnets_lista[1] # Asigna la segunda subred de la lista como privada.
  tags = {
    Name = "Subred Privada TPP-${local.tags_claves}"
  }
  depends_on = [
    aws_subnet.subred_publica
  ]
}

resource "aws_internet_gateway" "internet_gateway_gustavo" {
  vpc_id = aws_vpc.virginia_gustavo_vpc_tpp.id

  tags = {
    Name = "Internet Gateway TPP"
  }
}

resource "aws_route_table" "tabla_enrutamiento_publica_gustavo" {
  vpc_id = aws_vpc.virginia_gustavo_vpc_tpp.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_gustavo.id
  }

  tags = {
    Name = "tabla de enrutamiento publica TPP"
  }
}

resource "aws_route_table_association" "asociacion_tabla_enrutamiento_publica" {
  subnet_id      = aws_subnet.subred_publica.id
  route_table_id = aws_route_table.tabla_enrutamiento_publica_gustavo.id
}

resource "aws_security_group" "grupo_seguridad_publico" {
  name        = "Grupo de seguridad publico virginia gustavo tpp"
  description = "Permite el acceso a la instancia publica en Virginia"
  vpc_id      = aws_vpc.virginia_gustavo_vpc_tpp.id

  dynamic "ingress" {
    for_each = var.dynamic_gustavo
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.direccion_ip_gustavo]
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 significa todos los protocolos
    cidr_blocks = ["0.0.0.0/0"] # Permite todo el tráfico de salida
  }

  tags = {
    Name = "Security Group TPP"
  }

}



# ingress {
#   from_port   = 80
#   to_port     = 80
#   protocol    = "tcp"
#   cidr_blocks = [var.direccion_ip_gustavo]
# }





