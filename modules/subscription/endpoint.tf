locals {
  endpoint = var.protocol == "lambda" ? data.aws_lambda_alias.lambda[0].arn : var.endpoint
}
