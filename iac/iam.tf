resource "aws_iam_role" "iam_for_lambda" {
  name = var.role_iam_id

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  path        = "/"
  description = "IAM policy to a lambda"

   policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*",
      "Effect": "Allow"
    },
     {
        "Effect": "Allow",
        "Action": [
            "s3:*"
        ],
        "Resource": "*",
    },
    {
        "Effect": "Allow",
        "Action": [
            "elasticmapreduce:*"
                ],
        "Resource": "*",
    },
    {
        "Effect": "Allow",
        "Action": [ "iam:PassRole" ],
        "Resource": ["arn:aws:iam::account-id:role/EMR_DefaultRole",
                     "arn:aws:iam::account-id:role/EMR_EC2_DefaultRole"]
    }
        
  ]
}
)
}

resource "aws_iam_policy_attachment" "lambda-attach" {
  name = "lambda-attach_name"
  roles  =[ aws_iam_role.iam_for_lambda.name]
  policy_arn = aws_iam_policy.lambda_policy.arn
}