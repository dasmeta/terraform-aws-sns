## Example without dead-letter queue

locals {
  topic_name = "my-topic"
  sqs_name   = "my-sqs"
}

module "sqs" {
  source  = "dasmeta/modules/aws//modules/sqs"
  version = "0.36.7"

  name = local.sqs_name
}

module "topic" {
  source  = "dasmeta/sns/aws//modules/topic"
  version = "1.2.3"

  topic_name = local.topic_name
}

module "subscriptions" {
  source  = "dasmeta/sns/aws//modules//subscription"
  version = "1.2.3"

  topic    = local.topic_name
  protocol = "sqs"
  endpoint = local.sqs_name

  depends_on = [
    module.topic
  ]
}

## Example within dead-letter queue
locals {
  topic_name      = "my-topic"
  sqs_name        = "my-sqs"
  sqs_dead_letter = "my-sqs_dead"
}

module "sqs" {
  source  = "dasmeta/modules/aws//modules/sqs"
  version = "0.36.7"

  name = local.sqs_name
}

module "sqs_dead" {
  source  = "dasmeta/modules/aws//modules/sqs"
  version = "0.36.7"

  name = local.sqs_dead_letter
}

module "topic" {
  source  = "dasmeta/sns/aws//modules/topic"
  version = "1.2.3"

  topic_name = local.topic_name
}

module "subscriptions" {
  source  = "dasmeta/sns/aws//modules//subscription"
  version = "1.2.3"

  topic                = local.topic_name
  protocol             = "sqs"
  endpoint             = local.sqs_name
  dead_letter_sqs_name = local.sqs_dead_letter

  depends_on = [
    module.topic
  ]
}
