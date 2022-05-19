## HOW to use SNS module.

```terraform
module "sns" {
  source                              = "dasmeta/sns/aws//modules/topic"
  version                             = "1.1.1"

  sns_subscription_email_address_list = ["hello@example.com","hello1@example.com"]
  sns_subscription_phone_number_list  = ["+0000000000","2222222222"]
}
```