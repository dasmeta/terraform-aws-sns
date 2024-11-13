locals {
  subscriptions_map  = { for subscription in var.subscriptions : "${subscription.protocol}:${coalesce(subscription.name, sha256(subscription.endpoint))}" => subscription }
  subscriptions_keys = nonsensitive(keys(local.subscriptions_map))

  sns_policy = var.policy == null ? null : jsonencode(var.policy)
}
