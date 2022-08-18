locals {
  topic_arn = data.aws_sns_topic.main.arn
}

data "aws_sns_topic" "main" {
  name = var.topic
}
