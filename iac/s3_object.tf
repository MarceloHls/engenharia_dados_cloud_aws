resource "aws_s3_bucket_object" "codigo_python" {
  bucket = aws_s3_bucket.datalake.id
  key    = "code/python/codigo_python_terraform.py"
  acl    = "private"
  source = "../codigo_python.py"
  etag   = filemd5("../codigo_python.py")

}

