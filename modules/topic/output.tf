output "topic_arn" {
  value = aws_sns_topic.this[0].arn
}
