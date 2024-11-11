module "this" {
  source = "../../"
  name   = "test-topic"

  policy = {
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
        "Resource" : "arn:aws:sns:us-east-1:xxxxxxx:account-alarms-handling-virginia",
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceOwner" : "xxxxxx"
          }
        }
      },
      {
        "Sid" : "AWSBudgets-notification-1",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "budgets.amazonaws.com"
        },
        "Action" : "SNS:Publish",
        "Resource" : "*"
      }
    ]
  }
}
