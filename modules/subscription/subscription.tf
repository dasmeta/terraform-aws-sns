resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = local.topic_arn
  protocol  = var.protocol
  endpoint  = local.endpoint
}
