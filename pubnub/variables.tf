    variable "email" {
      description = "Email for PubNub authentication"
      type = string
    }

    variable "password" {
      description = "Password for PubNub authentication"
      type = string
      sensitive = true
    }

    variable "account_id" {
      description = "PubNub Account ID"
      type = number
    }

    variable "subscribe_key" {
      description = "PubNub Subscribe Key"
      type        = string
    }
    variable "app_name" {
      description = "Name of the new PubNub App"
      type = string
    }

    variable "app_type" {
      description = "Type of the PubNub App. 1 for default, 2 for chat"
      type = number
      default = 1
    }

    variable "key_type" {
      description = "Type of the PubNub Key. 1 for production, 0 for testing"
      type = number
      default = 1
    }

    variable "key_name" {
      description = "Name of the new PubNub API Key"
      type = string
    }

    variable "history" {
      description = "Enable/Disable History"
      type = number
      default = 1
    }

    variable "message_storage_ttl" {
      description = "TTL for message storage"
      type = number
      default = 30
    }

    variable "lms" {
      description = "Enable/Disable Large Message Support"
      type = number
      default = 0
    }

    variable "max_message_size" {
      description = "Max message size"
      type = number
      default = 1800
    }

    variable "multiplexing" {
      description = "Enable/Disable Multiplexing"
      type = number
      default = 1
    }

    variable "apns" {
      description = "Enable/Disable APNs"
      type = number
      default = 0
    }

    variable "uls" {
      description = "Enable/Disable ULS"
      type = number
      default = 0
    }

    variable "objects" {
      description = "Enable/Disable Objects"
      type = number
      default = 0
    }

    variable "illuminate_base_url" {
      description = "Base URL for the Illuminate API"
      type = string
    }

    variable "business_object_name" {
      description = "Name of the Illuminate Business Object"
      type = string
    }

    variable "business_object_description" {
      description = "Description of the Illuminate Business Object"
      type = string
    }

    variable "business_object_fields" {
      description = "Fields for the Illuminate Business Object"
      type = list(object({
        name = string
        jsonFieldType = string
        isKeyset = bool
        source = string
        jsonPath = string
      }))
    }

    variable "dashboard_name" {
      description = "Name of the Illuminate Dashboard"
      type = string
    }

    variable "dashboard_date_range" {
      description = "Date range for the Illuminate Dashboard"
      type = string
      default = "30 minutes"
    }

    variable "dashboard_charts" {
      description = "Charts for the Illuminate Dashboard"
      type = list(object({
        name = string
        metricId = string
        metric = object({
          name = string
          measureId = string
          businessObjectId = string
          function = string
          dimensionIds = list(string)
          evaluationWindow = number
        })
        viewType = string
        size = string
        dimensionIds = list(string)
      }))
    }
