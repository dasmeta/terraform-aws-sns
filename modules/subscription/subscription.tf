resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = local.topic_arn
  protocol  = var.protocol
  endpoint  = local.endpoint
}
