---
id: rest-api-provisioning-keys
title: REST APIs for Provisioning Keys
keywords: [REST API, Provisioning, PubNub, Keys, Account Management, Session Token, Authentication, App, Permissions, APNs, FCM, MPNS]
description: "Learn how to manage keys and permissions for PubNub accounts using REST APIs. Authenticate, create apps, and configure push services."
sidebar_label: REST APIs for Provisioning Keys
---

## Authenticate

Authenticate with an `email` and `password` to receive a `session_token`. The `session_token` is used for all requests after authentication. You also receive a `user_id` which is used in as well.

### Request

``` bash showLineNumbers
curl --request POST 'https://admin.pubnub.com/api/me' \
--header 'Content-Type: application/json' \
--data-raw '{"email":"<email>","password":"<password>"}'
```

### Response

```json showLineNumbers
{
  "result": {
    "role": "user",
    "status": 1,
    "token": "<session_token>",
    "user": {
      "created": 1407997326,
      "email": "<user_email>",
      "id": <user_id>,
      "login_attempts": 0,
      "login_attempts_last": null,
      "modified": 1489765991,
      "properties": {
        "first": "First Name",
        "last": "Last name",
        "phone": null,
        "utm_campaign": "Web",
        "utm_content": "Web",
        "utm_keyword": "Web",
        "utm_medium": "Web",
        "utm_source": "Web",
        "xsite_google:id": "id",
        "xsite_google:oauth_token": "1/MsQp3FUAdA1veqGpSciqeL0tU1ACjIhM",
        "xsite_google:oauth_token_secret": "KllnXoAPnnXm7d"
      },
      "status": 1
    },
    "user_id": <user_id>,
    "user_roles": {
      "is_internal_admin": false,
      "is_internal_operator": false,
      "is_internal_viewer": false,
      "roles": {}
    }
  }
}
```

Save the `user_id` and `session_token` for future requests.

## Get List of Apps

Your API Keys are organized by `Apps` containers. All your API Keys are stored here and you need `app_id` to make request change settings for your API Keys.

The `apps` endpoint comes with the optional parameter `no_keys`. If it's set, the request doesn't return a key list.

### Request

``` bash showLineNumbers
curl --request GET 'https://admin.pubnub.com/api/apps?owner_id=<account_id>&no_keys=1' --header 'X-Session-Token: <session_token>'
```

### Response

```json showLineNumbers
{
  "result": [
    {
        "created": 1407997326,
        "dates": {
            "stats_channel": {
                "created": 1408022525,
                "modified": null
            }
        },
        "id": <id>,
        "modified": null,
        "name": "My First PubNub App",
        "owner_id": <owner-id>,
        "properties": {
            "stats_channel": "2tQAhFZN5B69gtGvy"
        },
        "status": 1
    }
  ],
  "total": 1
}
```

## Get App details using App id

This will fetch the details of the app.

The `apps/<app_id>` endpoint comes with the optional parameter `no_keys`. If it's set, the request doesn't return a key list.

### Request

``` bash showLineNumbers
curl --request GET 'https://admin.pubnub.com/api/apps/<app_id>?no_keys=1' --header 'X-Session-Token: <session_token>'
```

### Response

```json showLineNumbers
{
    "result": {
        "created": 1407997326,
        "dates": {
            "stats_channel": {
                "created": 1408022525,
                "modified": null
            }
        },
        "id": <id>,
        "modified": null,
        "name": "My First PubNub App",
        "owner_id": <owner-id>,
        "properties": {
            "stats_channel": "2tQAhFZN5B69gtGvy"
        },
        "status": 1
    }
}
```

## Get List of Keys

The `/app/keys` endpoint provides you with the list of keys to retrieve for a given application. It comes with a set of required parameters that allow the keys to be paginated.

| Parameter | Type | Required | Description |
| :-------- | :--- | :------- | :---------- |
| `app_id` | Number | Yes | ID of the application to extract keys from |
| `page` | Number (from 1 to inf) | Yes | Page number |
| `limit` | Number (from 1 to inf) | Yes | Number of keys to get per page |

### Request

``` bash showLineNumbers
curl 'https://admin.pubnub.com/api/app/keys?app_id=<app_id>&page=2&limit=1' -H 'X-Session-Token: <token>'
```

### Response

The `total_keys` field returns the total number of all keys in the application.

```json showLineNumbers
{
    "result": {
        "keys": [
            {
                "app_id": 1,
                "app_type": {
                    "name": "chat",
                    "value": 2
                },
                "created": 1625078763,
                "dates": {
                    "bill_by_uuid": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "blocks": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "eh_skip_pub_func_exec_for_internal_chan_msg_enabled": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "history": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "message_storage_delete": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "message_storage_ttl": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "multiplexing": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "name": {
                        "created": 1625078763,
                        "modified": null
                    },
                    "objects_membership_events_enabled": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "objects_space_events_enabled": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "objects_user_events_enabled": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "pam_objects_disallow_getallchannels": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "pam_objects_disallow_getalluuids": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_announce_max": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_debounce": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_global_here_now": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_interval": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_k8s": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_leave_on_disconnect": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_search": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_store_event_messages": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "presence_stream_filtering": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "storage_location": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "wildcardgrant": {
                        "created": 1625078764,
                        "modified": null
                    },
                    "wildcardsubscribe": {
                        "created": 1625078763,
                        "modified": null
                    }
                },
                "expires": null,
                "id": 2,
                "modified": 1625078763,
                "product_id": 12,
                "properties": {
                    "bill_by_uuid": 1,
                    "blocks": 0,
                    "eh_skip_pub_func_exec_for_internal_chan_msg_enabled": 1,
                    "history": 1,
                    "message_storage_delete": 1,
                    "message_storage_ttl": 7,
                    "multiplexing": 1,
                    "name": "zxczxczc",
                    "objects_membership_events_enabled": 0,
                    "objects_space_events_enabled": 0,
                    "objects_user_events_enabled": 0,
                    "pam_objects_disallow_getallchannels": 0,
                    "pam_objects_disallow_getalluuids": 0,
                    "presence": 1,
                    "presence_announce_max": 20,
                    "presence_debounce": 2,
                    "presence_global_here_now": 0,
                    "presence_interval": 30,
                    "presence_k8s": 0,
                    "presence_leave_on_disconnect": 0,
                    "presence_search": 0,
                    "presence_store_event_messages": 0,
                    "presence_stream_filtering": 1,
                    "storage_location": 1,
                    "wildcardgrant": 1,
                    "wildcardsubscribe": 1
                },
                "publish_key": "publish key",
                "secret_key": "secret key",
                "status": 1,
                "subscribe_key": "subscribe key"
            }
        ],
        "total_keys": 3
    }
}
```

#### Sample response header

Links in the **link** header allow for crawling through pages. If there's no `next` or `prev` page, the link isn't generated. There is always a `first` page link.

```yaml
link: <https://admin.pubnub.com/api/app/keys?app_id=1&page=1&limit=1>; rel="first";<https://admin.pubnub.com/api/app/keys?app_id=1&page=1&limit=1>; rel="prev";<https://admin.pubnub.com/api/app/keys?app_id=1&page=3&limit=1>; rel="next";
```

## Create an App

Create an App container to organize your API Keys. Your account always starts with one App container, so don't create a new one unless you need to.

### Request

``` bash showLineNumbers
curl --request POST 'https://admin.pubnub.com/api/apps' \
--header 'X-Session-Token: <session_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "owner_id":<account_id>,
    "name":"My new app"
}'
```

### Response

```json showLineNumbers
{
    "result": {
        "created": 1612450966,
        "dates": {
            "stats_channel": {
                "created": 1612450965,
                "modified": null
            }
        },
        "id": <app_id>,
        "modified": null,
        "name": "My new app",
        "owner_id": <account_id>,
        "properties": {
            "stats_channel": <stats_channel>
        },
        "status": 1
    }
}
```

## Create a new set of API Keys

To provision a new set of keys on your account, you'll use this simple `POST` method. You will need the `app_id`, `session_token`, and other settings.

### Request

``` bash showLineNumbers
curl --request POST 'https://admin.pubnub.com/api/keys' \
--header 'X-Session-Token: <session_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "app_id" : <app_id>,
    "type": 1|0,  // 1 - production, 0 - testing
    "properties" : {
        "name" : <key_name>, // Name of the keyset
        "history" : 1|0,
        "message_storage_ttl" : 1...365,
        "lms" : 1|0,
        "max_message_size" : 1800 ... 7200,
        "multiplexing" : 1|0, // Stream Controller
        "apns" : 1|0,
        "uls" : 1|0, // Access Manager
        "objects" : 1|0,
        "objects_region" : <region_name>,
        "objects_user_events_enabled": 1|0,
        "objects_space_events_enabled" : 1|0,
        "objects_membership_events_enabled" : 1|0,
        "pam_objects_disallow_getallchannels" : 1|0,
        "pam_objects_disallow_getalluuids" : 1|0,
        "files_enabled" : 1|0,
        "files_s3_bucket_region" : <region_name>,       // If you modify the already set up region, you risk losing the existing files.
        "files_ttl_in_days" : 0...,
        "presence" : 1|0,
        "presence_announce_max" : 1...100,
        "presence_interval" : 1...300,
        "presence_deltas" : 1|0,
        "presence_leave_on_disconnect" : 1|0,
        "presence_stream_filtering" : 1|0,
        "presence_active_notice_channel" : <channel_name>,
        "presence_debounce" : 1|0,
        "presence_store_event_messages" : 1|0, // Message persistence - Include presence events
        "wildcardsubscribe": 1|0
    }
}'
```

### Response

```json showLineNumbers
{
    "result": {
        "created": 1491992709,
        "dates": {
            "apns": {
                "created": 1492017909,
                "modified": null
            },
            "bill_by_uuid": {
                "created": 1492017909,
                "modified": null
            },
            "history": {
                "created": 1492017909,
                "modified": null
            },
            "lms": {
                "created": 1492017909,
                "modified": null
            },
            "max_message_size": {
                "created": 1492017909,
                "modified": null
            },
            "message_storage_ttl": {
                "created": 1492017909,
                "modified": null
            },
            "multiplexing": {
                "created": 1492017909,
                "modified": null
            },
            "name": {
                "created": 1492017909,
                "modified": null
            },
            "presence": {
                "created": 1492017909,
                "modified": null
            },
            "uls": {
                "created": 1492017909,
                "modified": null
            }
        },
        "app_type": {
            "name": "pubsub",
            "value": 1
        },
        "id": <key_id>,
        "modified": 1491992709,
        "properties": {
            "name" : <key_name>,
            "history" : 1|0,
            "message_storage_ttl" : 1...365,
            "lms" : 1|0,
            "max_message_size" : 1800 ... 7200,
            "multiplexing" : 1|0,
            "apns" : 1|0,
            "uls" : 1|0,
            "bill_by_uuid": 1,
            "objects": 1|0,
            "objects_region": "aws-iad-1",
            "objects_user_events_enabled": 1|0,
            "objects_space_events_enabled" : 1|0,
            "objects_membership_events_enabled" : 1|0,
            "pam_objects_disallow_getallchannels" : 1|0,
            "pam_objects_disallow_getalluuids" : 1|0,
            "files_enabled": 1|0,
            "files_s3_bucket_region": "us-east-1",
            "files_ttl_in_days": 1,
            "presence" : 1|0,
            "presence_announce_max" : 20,
            "presence_interval" : 30,
            "presence_deltas" : 1|0,
            "presence_leave_on_disconnect" : 1|0,
            "presence_stream_filtering" : 1|0,
            "presence_active_notice_channel" : null,
            "presence_debounce" : 2
        },
        "app_id" : <app_id>,
        "publish_key" : <publish_key>,
        "subscribe_key" : <subscribe_key>,
        "secret_key" : <secret_key>,
        "status": 1
    }
}
```

## Modify API Key Settings

To upgrade or change an API Key Setting, you can issue the following `PUT` command.

### Request

``` bash showLineNumbers
curl --request PUT 'https://admin.pubnub.com/api/keys/<key_id>' \
--header 'X-Session-Token: <session_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "status" : 1, // Defaults to 1 (enabled), 0 (disabled) - cannot be enabled afterwards
    "type": 1|0,  // 1 - production, 0 - testing
    "properties" : {
        "name" : <key_name>, // Name of the keyset
        "history" : 1|0,
        "message_storage_ttl" : 1...365,
        "lms" : 1|0,
        "max_message_size" : 1800 ... 7200,
        "multiplexing" : 1|0, // Stream Controller
        "apns" : 1|0,
        "uls" : 1|0, // Access Manager
        "objects" : 1|0,
        "objects_region" : <region_name>,
        "objects_user_events_enabled": 1|0,
        "objects_space_events_enabled" : 1|0,
        "objects_membership_events_enabled" : 1|0,
        "pam_objects_disallow_getallchannels" : 1|0,
        "pam_objects_disallow_getalluuids" : 1|0,
        "files_enabled" : 1|0,
        "files_s3_bucket_region" : <region_name>,       // If you modify the already set up region, you risk losing the existing files.
        "files_ttl_in_days" : 0...,
        "presence" : 1|0,
        "presence_announce_max" : 1...100,
        "presence_interval" : 1...300,
        "presence_deltas" : 1|0,
        "presence_leave_on_disconnect" : 1|0,
        "presence_stream_filtering" : 1|0,
        "presence_active_notice_channel" : <channel_name>,
        "presence_debounce" : 1|0,
        "presence_store_event_messages" : 1|0, // Message persistence - Include presence events
        "wildcardsubscribe": 1|0
    }
}'
```

### Response

```json showLineNumbers
{
    "result": {
        "created": 1491992709,
        "dates": {
            "apns": {
                "created": 1492017909,
                "modified": null
            },
            "bill_by_uuid": {
                "created": 1492017909,
                "modified": null
            },
            "history": {
                "created": 1492017909,
                "modified": null
            },
            "lms": {
                "created": 1492017909,
                "modified": null
            },
            "max_message_size": {
                "created": 1492017909,
                "modified": null
            },
            "message_storage_ttl": {
                "created": 1492017909,
                "modified": null
            },
            "multiplexing": {
                "created": 1492017909,
                "modified": null
            },
            "name": {
                "created": 1492017909,
                "modified": null
            },
            "presence": {
                "created": 1492017909,
                "modified": null
            },
            "uls": {
                "created": 1492017909,
                "modified": null
            }
        },
        "id": <account_id>,
        "modified": 1491992709,
        "product_id": 12,
        "app_type": {
            "name": "pubsub",
            "value": 1
        },
        "properties": {
            "name" : <key_name>,
            "history" : 1|0,
            "message_storage_ttl" : 1...365,
            "lms" : 1|0,
            "max_message_size" : 1800 ... 7200,
            "multiplexing" : 1|0,
            "apns" : 1|0,
            "uls" : 1|0,
            "bill_by_uuid" : 1,
            "objects" : 1|0,
            "objects_region": "aws-iad-1",
            "objects_user_events_enabled": 1|0,
            "objects_space_events_enabled" : 1|0,
            "objects_membership_events_enabled" : 1|0,
            "pam_objects_disallow_getallchannels" : 1|0,
            "pam_objects_disallow_getalluuids" : 1|0,
            "files_enabled" : 1|0,
            "files_s3_bucket_region" : "us-east-1",
            "files_ttl_in_days" : 1,
            "presence" : 1|0,
            "presence_announce_max" : 20,
            "presence_interval" : 30,
            "presence_deltas" : 1|0,
            "presence_leave_on_disconnect" : 1|0,
            "presence_stream_filtering" : 1|0,
            "presence_active_notice_channel" : null,
            "presence_debounce" : 2
        },
        "app_id" : <app_id>,
        "publish_key" : <publish_key>,
        "subscribe_key" : <subscribe_key>,
        "secret_key" : <secret_key>,
        "status": 1
    }
}
```

## Push Notifications

### Configure APNs

APNs can be configured in just one call

``` bash showLineNumbers
curl --request PUT 'https://admin.pubnub.com/api/keys/<key_id>' \
--header 'X-Session-Token: <session_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
  "status": 1,
  "properties": {
      "apns": 1,
      "token_key": "<token_file_contents>",
      "apns_token_filename": "<apns_pem_filename>",
      "apns_team_id": "<apns_team_id>",
      "apns_auth_key_id": "<apns_auth_key_id>",
  }
}'
```

### Configure FCM HTTP v1

The FCM HTTP v1 API can be configured in just one call

``` bash showLineNumbers
curl --request PUT 'https://admin.pubnub.com/api/services/configure-fcm/<key_id>?fcm_key_filename=<fcm_key_filename>' \
--header 'X-Session-Token: <session_token>' \
--header 'Content-Type: application/json' \
--data-raw '<fcm_key_file_contents>'
```

Alternatively, you can have curl read and send the FCM key file contents from a file specified using the `--data-binary @<filename>` option, as follows:

``` bash showLineNumbers
curl --request PUT 'https://admin.pubnub.com/api/services/configure-fcm/<key_id>?fcm_key_filename=<fcm_key_filename>' \
--header 'X-Session-Token: <session_token>' \
--header 'Content-Type: application/json' \
--data-binary @<filename>
```

## REST Examples

### Authentication

``` bash showLineNumbers
curl --request POST 'https://admin.pubnub.com/api/me' \
--header 'Content-Type: application/json' \
--data-raw '{"email":"<email>","password":"<password>"}'
```

### New API Key with 30 days Message Persistence + Multiplexing

Stream this payload on a TLS/SSL socket only.

```json showLineNumbers
{
    "status" : 1,
    "app_id" : <app_id>,
    "properties" : {
        "name" : "My Test Key 2",
        "multiplexing": 1,
        "history" : 1,
        "message_storage_ttl" : 30
    }
}
```

### PHP Example

```php showLineNumbers
//Example to create a sandbox key with history enabled

$base_api_url = 'https://admin.pubnub.com/api';
$auth_token = '58ab7469-73be-450c-8113-e38f007c7e71';
$app_id = 225108;

$url = $base_api_url . '/keys';
$fields = json_encode(array(
    'app_id' => $app_id,
    'properties' => array(
        'history' => 1
    )
));
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL, $url);
curl_setopt($ch,CURLOPT_POST, 1);
curl_setopt($ch,CURLOPT_POSTFIELDS, $fields);
curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch,CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'X-Session-Token: ' . $auth_token
));
$result = curl_exec($ch);
curl_close($ch);

$result = json_decode($result);
//Example to disable a sandbox key

$base_api_url = 'https://admin.pubnub.com/api';
$auth_token = '58ab7469-73be-450c-8113-e38f007c7e71';
$key_id = 56084;

$url = $base_api_url . '/keys/' . $key_id;
$fields = json_encode(array(
    'status' => 0,
));
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL, $url);
curl_setopt($ch,CURLOPT_POST, 1);
curl_setopt($ch,CURLOPT_POSTFIELDS, $fields);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch,CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'X-Session-Token: ' . $auth_token
));
$result = curl_exec($ch);
curl_close($ch);

$result = json_decode($result);
```

## Get list of keys from Vault

Provides list of all key names stored in vault for given subscribe key.

### Request

``` bash showLineNumbers
curl --request GET 'https://admin.pubnub.com/api/vault/<subscribe_key>/keys' \
--header 'X-Session-Token: <session_token>'
```

### Response

```json showLineNumbers
{
    "values": ["secret_name1", "secret_name2"]
}
```

## Add or Update key in Vault

Creates or updates key with given name if one exists in the vault for given subscribe key.

### Request

``` bash showLineNumbers
curl --request PUT 'https://admin.pubnub.com/api/vault/<subscribe_key>/key/<key_name>' \
--header 'X-Session-Token: <session_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "subscribeKey": "<subscribe_key>",
    "keyName": "<key_name>",
    "value": "<new_value>"
}'
```

### Response

```json showLineNumbers
{
    "success": true
}
```

## Remove Key from Vault

Removes key with given name from the vault for given subscribe key.

### Request

``` bash showLineNumbers
curl --request DELETE 'https://admin.pubnub.com/api/vault/<subscribe_key>/key/<key_name>' \
--header 'X-Session-Token: <session_token>'
```

### Response

```json showLineNumbers
{
    "success": true
}
```
