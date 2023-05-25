module "this" {
  source = "../../"
  name   = "aws-config-to-servicenow-cmdb"

  subscriptions = [
    {
      name     = "test-lambda-function-subscription"
      protocol = "lambda"
      endpoint = module.lambda_function.lambda_function_arn
    },
    {
      name     = "test-lambda-endpoint-subscription"
      protocol = "https"
      endpoint = "https://cd8583f1-559b-4531-9ab3-e7eb5cd94a2e.mock.pstmn.io"
    }
  ]

  depends_on = [
    module.lambda_function
  ]

  policy = jsonencode({
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
        "Resource" : "arn:aws:sns:us-east-1:565580475168:aws-config-to-servicenow-cmdb",
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceOwner" : "565580475168"
          }
        }
      },
      {
        "Sid" : "AWSConfigSNSPolicy20180529",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::565580475168:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"
        },
        "Action" : "sns:Publish",
        "Resource" : "arn:aws:sns:us-east-1:565580475168:aws-config-to-servicenow-cmdb"
      }
    ]
  })
}
