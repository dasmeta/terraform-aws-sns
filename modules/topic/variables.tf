variable "name" {
  type        = string
  description = "SNS topic name."
}

variable "create" {
  type        = bool
  default     = true
  description = "Whether to create the topic or not"
}

variable "policy" {
  type        = string
  default     = null
  description = "This policy defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic."
}

variable "subscriptions" {
  type = list(object({
    name                   = optional(string, null)
    protocol               = string
    endpoint               = string
    endpoint_auto_confirms = optional(bool, false)
    dead_letter_queue_arn  = optional(string)
  }))
  default     = []
  description = "SNS Subscriptions"
}

variable "delivery_policy" {
  type        = any
  description = "The SNS topic delivery policy"
  default = {
    "http" : {
      "defaultHealthyRetryPolicy" : {
        "minDelayTarget" : 20,
        "maxDelayTarget" : 20,
        "numRetries" : 3,
        "numMaxDelayRetries" : 0,
        "numNoDelayRetries" : 0,
        "numMinDelayRetries" : 0,
        "backoffFunction" : "linear"
      },
      "disableSubscriptionOverrides" : false,
      "defaultThrottlePolicy" : {
        "maxReceivesPerSecond" : 1
      }
    }
  }
}
