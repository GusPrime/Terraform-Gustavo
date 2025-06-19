resource "aws_instance" "ec2_instancia_publica_cplx" {
  for_each               = var.instancias
  provider               = aws.virginia # De esta manera enlazamos el provider con el recurso mediante un alias.
  ami                    = var.especificaciones_ec2_gustavo_virginia[0]
  instance_type          = var.especificaciones_ec2_gustavo_virginia[1]
  subnet_id              = aws_subnet.subred_publica.id
  key_name               = data.aws_key_pair.gustavo_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.grupo_seguridad_publico.id]
  user_data              = file("scripts/userdata.sh")
  tags = {
    "Name" = "${each.value}-${local.tags_claves}"
  }
}


resource "aws_instance" "ec2_instancia_publica_gustavo_condicionales" {
  count                  = var.instancia_monitoreo == 3 ? 1 : 0
  ami                    = var.especificaciones_ec2_gustavo_virginia[0]
  instance_type          = var.especificaciones_ec2_gustavo_virginia[1]
  subnet_id              = aws_subnet.subred_publica.id
  key_name               = data.aws_key_pair.gustavo_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.grupo_seguridad_publico.id]
  user_data              = file("scripts/userdata.sh")
  tags = {
    "Name" = "Monitoreo-${local.tags_claves}"
  }
}



# Ejemplo de como cambiar el nombre de un recurso.
# moved {
#   from = aws_instance.ec2_instancia_publica_gustavo
#   to   = aws_instance.ec2_instancia_publica_cplx
# }
