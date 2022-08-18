module "topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 3.0"

  name = "my-topic"
}

module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "3.3.1"

  function_name = "my-lambda1"
  # description   = "My awesome lambda function"
  # handler       = "index.lambda_handler"
  # runtime       = "python3.8"

  source_path = "./lambda-source"
}

module "subscription" {
  topic    = "my-topic"
  protocol = "lambda"
  endpotin = "my-lambda1"

  // this is necessary as otherwise resource will not be create
  depends_on = [
    module.topic,
    module.lambda
  ]
}
