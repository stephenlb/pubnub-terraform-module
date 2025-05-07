variable "pubnub_email" {
  description = "Email for PubNub authentication"
  type        = string
}

variable "pubnub_password" {
  description = "Password for PubNub authentication"
  type        = string
  sensitive   = true
}

variable "pubnub_account_id" {
  description = "PubNub Account ID"
  type        = number
}

variable "subscribe_key" {
  description = "PubNub Subscribe Key"
  type        = string
}

provider "http" {}

module "pubnub" {
  source = "../pubnub"

  email                        = var.pubnub_email
  password                     = var.pubnub_password
  account_id                   = var.pubnub_account_id
  subscribe_key                = var.subscribe_key

  app_name                     = "Webhook App"
  key_name                     = "Webhook Keys"

  app_type                     = 1
  key_type                     = 1
  history                      = 1
  message_storage_ttl          = 30
  lms                          = 0
  max_message_size             = 1800
  multiplexing                 = 1
  apns                         = 0
  uls                          = 0
  objects                      = 0

  illuminate_base_url          = "admin.pubnub.com"
  business_object_name         = "Webhook Business Object"
  business_object_description  = "Business object for Webhook App"
  business_object_fields       = []

  dashboard_name               = "Webhook Dashboard"
  dashboard_date_range         = "30 minutes"
  dashboard_charts             = []
}

output "app_id" {
  description = "The ID of the created PubNub App"
  value       = module.pubnub.app_id
}

output "key_id" {
  description = "The ID of the created PubNub API Key"
  value       = module.pubnub.key_id
}