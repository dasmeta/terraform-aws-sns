data "aws_lambda_function" "lambda" {
  count         = var.protocol == "lambda" ? 1 : 0
  function_name = var.endpoint
}

resource "aws_lambda_permission" "lambda_with_sns" {
  count = var.protocol == "lambda" ? 1 : 0

  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = var.endpoint
  principal     = "sns.amazonaws.com"
  source_arn    = local.topic_arn
}
