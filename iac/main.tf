resource "aws_s3_bucket" "datalake" {
  bucket = "$(var.bucket_name)-$(var.environment)-$(var.account_number)"
  acl = "private"


  server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_configuration {
            sse_algorithm   = "AES256"
        }
    }
  }
}


resource "aws_s3_bucket_object" "codigo_python" {
    bucket = aws_s3_bucket.datalake.id
    key = "code/python/codigo_python_terraform.py"
    acl = "private"
    source = "codigo_python.py"
    etag = filemd5("codigo_python.py")
  
}

provider "aws" {
    region = "$(var.region)"
}