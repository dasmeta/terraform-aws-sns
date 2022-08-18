<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic_subscription.user_updates_sqs_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_lambda_alias.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lambda_alias) | data source |
| [aws_sns_topic.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sns_topic) | data source |
| [aws_sqs_queue.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sqs_queue) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Endpoint of subscription messages will be delivered to (SQS name in case of sqs). | `any` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol of subscription (lambda, sqs, ...). | `any` | n/a | yes |
| <a name="input_topic"></a> [topic](#input\_topic) | The name of SNS topic subscription should be attached to (not arn). | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->