data "aws_sqs_queue" "sqs" {
  count = var.protocol == "sqs" ? 1 : 0

  name = var.endpoint
}

data "aws_sqs_queue" "dead_letter" {
  count = var.dead_letter_sqs_name == "" ? 0 : 1

  name = var.dead_letter_sqs_name
}
