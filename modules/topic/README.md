## How to use SNS module with Multiple Subscribers.

```terraform
provider "aws" {
  region = "us-east-1"
}

locals {
  sns_topic_subscriptions = [
    {
      name                   = "sns"
      topic_arn              = "arn:aws:sns:us-east-1:565580475168:sns"
      protocol               = "email"
      endpoint               = "example@gmail.com"
      endpoint_auto_confirms = false
    },
    {
      name                   = "sns"
      topic_arn              = "arn:aws:sns:us-east-1:565580475168:sns"
      protocol               = "sms"
      endpoint               = "+00000000"
      endpoint_auto_confirms = false
    },
    {
      name                   = "sns"
      topic_arn              = "arn:aws:sns:us-east-1:565580475168:sns"
      protocol               = "lambda"
      endpoint               = "some_arn"
      endpoint_auto_confirms = false
    },
  ]
}

module "subscriptions" {
  source                  = "dasmeta/sns/aws//modules/topic""
  version                             = "0.0.0.1"
  sns_topic_subscriptions = local.sns_topic_subscriptions
}
```


## Minimum configuration.

```terraform
provider "aws" {
  region = "us-east-1"
}

locals {
  sns_topic_subscriptions = [
    {
      name                   = "sns"
      topic_arn              = "arn:aws:sns:us-east-1:565580475168:sns"
      protocol               = "https"
      endpoint               = "..."
      endpoint_auto_confirms = false
    }
  ]
}

module "subscriptions" {
  source                  = "dasmeta/sns/aws//modules/topic""
  version                             = "0.0.0.1"
  sns_topic_subscriptions = local.sns_topic_subscriptions
}
```