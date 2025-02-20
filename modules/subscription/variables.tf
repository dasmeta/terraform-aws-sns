variable "topic" {
  description = "The name of SNS topic subscription should be attached to (not arn)."
}

variable "protocol" {
  description = "Protocol of subscription (lambda, sqs, ...)."

  validation {
    condition     = can(regex("^lambda$|^https$|^http$|^email-json$|^email$|^sqs$", var.protocol))
    error_message = "Protocol value must be in (lambda, sqs, ...)."
  }
}

variable "endpoint" {
  description = "Endpoint of subscription messages will be delivered to (SQS name in case of sqs)."
}

variable "dead_letter_sqs_name" {
  description = "Name dead-letter queue for send undeliverable messages."
  default     = ""
}
