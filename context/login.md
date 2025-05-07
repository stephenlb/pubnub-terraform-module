## Authenticate

To work with the Events & Actions API, you need a unique `session_token`. You can get it by authenticating to PubNub's Provisioning API with the `email` and `password` from your [Admin Portal](https://admin.pubnub.com) account. This API does not support Single Sign-On (SSO) functionality.

### Request

```bash

curl --request POST "https://admin.pubnub.com/api/me" \
  --header "Content-Type: application/json" \
  --data-raw "{\"email\":\"<email>\",\"password\":\"<password>\"}"

```

### Response

```json
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
