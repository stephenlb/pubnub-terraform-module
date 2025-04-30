     output "app_id" {
       description = "The ID of the created PubNub App"
       value       = null_resource.create_pubnub_app.triggers.session_token
     }

     output "key_id" {
       description = "The ID of the created PubNub API Key"
       value       = null_resource.create_pubnub_api_key.triggers.app_id
     }

     output "business_object_id" {
       description = "The ID of the created Illuminate Business Object"
       value       = null_resource.setup_illuminate_business_object.triggers.key_id
     }

     output "dashboard_id" {
       description = "The ID of the created Illuminate Dashboard"
      value       = null_resource.create_illuminate_dashboard.triggers.activate_business_object
    }

    output "action_ids" {
      description = "The IDs of the created PubNub Actions"
      value       = { for name, r in openapi_resource.actions : name => r.response_body.id }
    }

    output "event_ids" {
      description = "The IDs of the created PubNub Events"
      value       = { for name, r in openapi_resource.events  : name => r.response_body.id }
    }