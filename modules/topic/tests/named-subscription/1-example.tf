module "this" {
  source = "../../"
  name   = "test-topic"
  subscriptions = [
    {
      name     = "test-name"
      protocol = "https"
      endpoint = "https://example.com"
    },
  ]
}
