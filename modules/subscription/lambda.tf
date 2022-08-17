data "aws_lambda_alias" "lambda" {
  count         = var.protocol == "lambda" ? 1 : 0
  function_name = var.endpoint
  name          = var.endpoint
}
