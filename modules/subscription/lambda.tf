data "aws_lambda_function" "lambda" {
  count         = var.protocol == "lambda" ? 1 : 0
  function_name = var.endpoint
}
