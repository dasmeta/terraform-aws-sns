data "aws_sqs_queue" "example" {
  count = var.protocol == "sqs" ? 1 : 0

  name = var.endpoint
}
