// Support provisioning of PubNub Events & Actions via OpenAPI spec

terraform {
  required_providers {
    openapi = {
      source  = "variantdev/openapi"
      version = ">= 0.14.0"
    }
  }
}

provider "openapi" {
  alias      = "events_and_actions"
  # Path to the OpenAPI specification for Events & Actions
  spec       = file("${path.module}/../context/events_and_actions.yaml")
  # Authenticate using the PubNub session token
  auth {
    type  = "apiKey"
    name  = "X-Session-Token"
    in    = "header"
    value = trim(file(local.session_token_file))
  }
}

# Create PubNub Actions via Events & Actions API
resource "openapi_resource" "actions" {
  provider     = openapi.events_and_actions
  for_each     = { for action in var.actions : action.name => action }
  operation_id = "createAction"
  # API request body based on specification
  request_body = jsonencode({
    name    = each.value.name
    type    = each.value.type
    url     = each.value.url
    headers = each.value.headers
    body    = each.value.body
  })
}

# Create PubNub Events via Events & Actions API and attach to actions
resource "openapi_resource" "events" {
  provider     = openapi.events_and_actions
  for_each     = { for event in var.events : event.name => event }
  operation_id = "createEvent"
  request_body = jsonencode({
    name       = each.value.name
    status     = each.value.status
    filter     = each.value.filter
    actionIds  = each.value.action_ids
  })
  depends_on = [openapi_resource.actions]
}