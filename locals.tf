locals {
  tags_claves = "${var.tags_locales.Devops}-${var.tags_locales.Proyecto}-${var.tags_locales.Ambiente}"
}

locals {
  tags_s3_ejemplo = "${var.tags_ejemplo_gustavo.Empresa}-${var.tags_ejemplo_gustavo.Ambiente}-${var.tags_ejemplo_gustavo.Proyecto}-${random_string.random_ejemplo_gustavo.id}"
}
