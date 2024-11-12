locals {
  subscriptions_map  = { for subscription in var.subscriptions : "${subscription.protocol}:${coalesce(subscription.name, sha256(subscription.endpoint))}" => subscription }
  subscriptions_keys = nonsensitive(keys(local.subscriptions_map))

  sns_policy = var.policy == null ? jsonencode({
    "Version" : "2008-10-17",
    "Id" : "__default_policy_ID",
    "Statement" : [
      {
        "Sid" : "__default_statement_ID",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
        },
        "Action" : [
          "SNS:GetTopicAttributes",
          "SNS:SetTopicAttributes",
          "SNS:AddPermission",
          "SNS:RemovePermission",
          "SNS:DeleteTopic",
          "SNS:Subscribe",
          "SNS:ListSubscriptionsByTopic",
          "SNS:Publish"
        ],
        "Resource" : "arn:aws:sns:us-east-1:${data.aws_caller_identity.current.account_id}:${var.name}",
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceOwner" : "${data.aws_caller_identity.current.account_id}"
          }
        }
      }
    ]
  }) : jsonencode(var.policy)
}
