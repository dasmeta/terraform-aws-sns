locals {
  endpoint = var.protocol == "lambda" ? data.aws_lambda_function.lambda[0].arn : var.endpoint
}
