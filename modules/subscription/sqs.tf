data "aws_sqs_queue" "sqs" {
  count = var.protocol == "sqs" ? 1 : 0

  name = var.endpoint
}
