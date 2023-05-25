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
  version                             = "1.0.1"
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
  version                             = "1.0.1"
  sns_topic_subscriptions = local.sns_topic_subscriptions
}
```

## Protocols for SNS Subscription
```terraform
`Amazon SQS`
`AWS Lambda`
`Email`
`Email-JSON`
`HTTP`
`HTTPS`
`SMS`
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.50.0 |

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_sns_topic"></a> [create\_sns\_topic](#input\_create\_sns\_topic) | Bool topic | `bool` | `true` | no |
| <a name="input_sns_topic_subscriptions"></a> [sns\_topic\_subscriptions](#input\_sns\_topic\_subscriptions) | SNS Subscriptions | <pre>list(object({<br>    name                   = string<br>    topic_arn              = string<br>    protocol               = string<br>    endpoint               = string<br>    endpoint_auto_confirms = bool<br>  }))</pre> | `[]` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | SNS topic name. | `string` | `"topic"` | no |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sns_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the topic or not | `bool` | `true` | no |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | The SNS topic delivery policy | `any` | <pre>{<br>  "http": {<br>    "defaultHealthyRetryPolicy": {<br>      "backoffFunction": "linear",<br>      "maxDelayTarget": 20,<br>      "minDelayTarget": 20,<br>      "numMaxDelayRetries": 0,<br>      "numMinDelayRetries": 0,<br>      "numNoDelayRetries": 0,<br>      "numRetries": 3<br>    },<br>    "defaultThrottlePolicy": {<br>      "maxReceivesPerSecond": 1<br>    },<br>    "disableSubscriptionOverrides": false<br>  }<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | SNS topic name. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | This policy defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic. | `string` | `null` | no |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | SNS Subscriptions | <pre>list(object({<br>    name                   = optional(string, null)<br>    protocol               = string<br>    endpoint               = string<br>    endpoint_auto_confirms = optional(bool, false)<br>    dead_letter_queue_arn  = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sns_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the topic or not | `bool` | `true` | no |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | The SNS topic delivery policy | `any` | <pre>{<br>  "http": {<br>    "defaultHealthyRetryPolicy": {<br>      "backoffFunction": "linear",<br>      "maxDelayTarget": 20,<br>      "minDelayTarget": 20,<br>      "numMaxDelayRetries": 0,<br>      "numMinDelayRetries": 0,<br>      "numNoDelayRetries": 0,<br>      "numRetries": 3<br>    },<br>    "defaultThrottlePolicy": {<br>      "maxReceivesPerSecond": 1<br>    },<br>    "disableSubscriptionOverrides": false<br>  }<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | SNS topic name. | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | This policy defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic. | `string` | `null` | no |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | SNS Subscriptions | <pre>list(object({<br>    name                   = optional(string, null)<br>    protocol               = string<br>    endpoint               = string<br>    endpoint_auto_confirms = optional(bool, false)<br>    dead_letter_queue_arn  = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
