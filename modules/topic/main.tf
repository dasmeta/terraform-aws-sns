resource "aws_sns_topic" "this" {
  count = var.create ? 1 : 0

  name            = var.name
  delivery_policy = jsonencode(var.delivery_policy)
  policy          = local.sns_policy
}

data "aws_sns_topic" "this" {
  count = var.create ? 0 : 1

  name = var.name
}

resource "aws_sns_topic_subscription" "this" {
  for_each = { for key in local.subscriptions_keys : key => key }

  topic_arn              = try(aws_sns_topic.this[0].arn, data.aws_sns_topic.this[0].arn)
  protocol               = local.subscriptions_map[each.value].protocol
  endpoint               = local.subscriptions_map[each.value].endpoint
  endpoint_auto_confirms = local.subscriptions_map[each.value].endpoint_auto_confirms

  redrive_policy = (try(each.value.dead_letter_queue_arn, null) == null) ? null : jsonencode({
    deadLetterTargetArn = each.value.dead_letter_queue_arn
  })
}
