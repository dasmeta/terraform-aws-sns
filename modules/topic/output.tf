
output "name" {
  value = try(aws_sns_topic.this[0].name, data.aws_sns_topic.this[0].name)
}

output "arn" {
  value = try(aws_sns_topic.this[0].arn, data.aws_sns_topic.this[0].arn)
}
