resource "aws_s3_bucket" "bucket_ejemplo_gustavo" {
  bucket = "complexless-${local.tags_s3_ejemplo}"
}



resource "random_string" "random_ejemplo_gustavo" {
  length  = 6
  special = false
  upper   = false
}

