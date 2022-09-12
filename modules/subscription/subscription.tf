resource "aws_sns_topic_subscription" "subscription" {
  topic_arn      = local.topic_arn
  protocol       = var.protocol
  endpoint       = local.endpoint
  redrive_policy = var.dead_letter_sqs_name == "" ? null : "{\"deadLetterTargetArn\": \"${data.aws_sqs_queue.dead_letter[0].arn}\"}"
}
