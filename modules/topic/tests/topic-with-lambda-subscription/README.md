# topic-with-lambda-subscription

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.33 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.33 |
| <a name="provider_test"></a> [test](#provider\_test) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | terraform-aws-modules/lambda/aws | 4.7.1 |
| <a name="module_lambda_function_check_recording7"></a> [lambda\_function\_check\_recording7](#module\_lambda\_function\_check\_recording7) | terraform-aws-modules/lambda/aws | 4.7.1 |
| <a name="module_lambda_function_check_recording9"></a> [lambda\_function\_check\_recording9](#module\_lambda\_function\_check\_recording9) | terraform-aws-modules/lambda/aws | 4.7.1 |
| <a name="module_this"></a> [this](#module\_this) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| test_assertions.dummy | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
