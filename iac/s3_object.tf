resource "aws_s3_bucket_object" "codigo_1" {
  bucket = aws_s3_bucket.datalake.id
  key    = "code/python/codigo_python_terraform.py"
  acl    = "private"
  source = "etl/codigo_1.py"
  etag   = filemd5("etl/codigo_1.py")

}

resource "aws_s3_bucket_object" "codigo_2" {
  bucket = aws_s3_bucket.datalake.id
  key    = "code/python/codigo_python_terraform.py"
  acl    = "private"
  source = "etl/codigo_2.py"
  etag   = filemd5("etl/codigo_2.py")

}

resource "aws_s3_bucket_object" "codigo_3" {
  bucket = aws_s3_bucket.datalake.id
  key    = "code/python/codigo_python_terraform.py"
  acl    = "private"
  source = "etl/codigo_3.py"
  etag   = filemd5("etl/codigo_3.py")

}


