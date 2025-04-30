 # Events & Actions Example

 This example demonstrates how to use the PubNub Terraform module to provision a webhook Action and an Event that triggers the webhook on new chat messages.

 ## Prerequisites

- Terraform 0.14+
- A PubNub account with `email`, `password`, `account_id`, and `subscribe_key`
- Clone or reference the `pubnub` Terraform module in your project

 ## Example Configuration

 Create a file `main.tf` with the following content:

 ```hcl
 provider "http" {}

 module "pubnub_with_webhook" {
   source          = "./pubnub"

   # PubNub authentication
   email           = var.pubnub_email
   password        = var.pubnub_password
   account_id      = var.pubnub_account_id
   subscribe_key   = var.subscribe_key

   # PubNub App & Key settings
   app_name        = "Webhook App"
   key_name        = "Webhook Key"
   app_type        = 1
   key_type        = 1
   history         = 1
   message_storage_ttl = 30

   # Define the Webhook Action
   actions = [
     {
       name    = "message_webhook"
       type    = "webhook"
       url     = "https://example.com/webhook"
       headers = {
         "X-Custom-Header" = "MyHeaderValue"
       }
       body    = <<JSON
{
  "message": "$${message.text}",
  "channel": "$${channel}",
  "timetoken": "$${message.timetoken}"
}
JSON
     }
   ]

   # Define the Event that triggers the webhook on chat messages
   events = [
     {
       name       = "on_chat_message"
       status     = "ENABLED"
       filter     = "payload.messageType == \"chat\""
       action_ids = [ module.pubnub_with_webhook.action_ids["message_webhook"] ]
     }
   ]
 }

 output "webhook_action_id" {
   description = "ID of the created webhook Action"
   value       = module.pubnub_with_webhook.action_ids["message_webhook"]
 }

 output "on_chat_message_event_id" {
   description = "ID of the created message Event"
   value       = module.pubnub_with_webhook.event_ids["on_chat_message"]
 }
```

 Save the file and run:

 ```bash
 terraform init
 terraform apply -auto-approve
 ```

 This will provision:
 - A new PubNub App and API Key
 - A webhook Action named `message_webhook` that posts message payloads to your HTTP endpoint
 - An Event named `on_chat_message` that triggers the webhook whenever a chat message is received
 - Outputs the IDs of the created Action and Event for your reference
