terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.33"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.7.1"

  function_name = "example-lambda-function"
  description   = "Example Lambda function"
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  source_path = "./src/lambda"
  publish     = true

  allowed_triggers = {
    AllowExecutionFromSNS = {
      service    = "sns"
      source_arn = "arn:aws:sns:us-east-1:${data.aws_caller_identity.current.account_id}:aws-config-created-sns-topic2"
    }
  }

  tags = {
    Name = "example-lambda-function"
  }
}

# TODO: remove this before commit
module "lambda_function_check_recording7" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.7.1"

  function_name = "example-lambda-function-check-recording7"
  description   = "Example Lambda function check recording7"
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  source_path = "./src/lambda"

  tags = {
    Name = "example-lambda-function-check-recording7"
  }
}

module "lambda_function_check_recording9" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.7.1"

  function_name = "example-lambda-function-check-recording9"
  description   = "Example Lambda function check recording9"
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  source_path = "./src/lambda"

  tags = {
    Name = "example-lambda-function-check-recording9"
  }
}
