# Create Action

### Request URL
https://admin.pubnub.com/api/keysets/\<SUBSCRIBE\_KEY\>/actions

### Request Method
POST

### POST Body
{"name":"Action 1","category":"webhook","configuration":{"retryEnabled":true,"maxNumRetries":2,"retryInterval":450,"target":"https://www.pubnub.com/docs/serverless/functions/functions-apis/xhr-module","additionalHeaders":{"header":"value"},"BatchConfig":{"maxNumParts":100,"ttlSeconds":5,"maxBytesSize":5000000,"batchingEnabled":false},"outputMessageFormatConfig":{"isEnveloped":true,"envelopeVersion":"2.1"}},"eventListeners":[]}

### Response
{
    "subscribeKey": "\<SUBSCRIBE\_KEY\>",
    "name": "Action 1",
    "category": "webhook",
    "version": "1",
    "configuration": {
        "retryEnabled": true,
        "maxNumRetries": 2,
        "retryInterval": 450,
        "target": "https://www.pubnub.com/docs/serverless/functions/functions-apis/xhr-module",
        "additionalHeaders": {
            "header": "value"
        },
        "BatchConfig": {
            "maxNumParts": 100,
            "ttlSeconds": 5,
            "maxBytesSize": 5000000,
            "batchingEnabled": false
        },
        "outputMessageFormatConfig": {
            "isEnveloped": true,
            "envelopeVersion": "2.1"
        }
    },
    "eventListeners": [],
    "updatedAt": "2025-05-02T20:02:24.830Z",
    "id": "290dd25e-dd28-4b18-a3d9-9ef97bf7e60d",
    "status": "on",
    "createdAt": "2025-05-02T20:02:24.830Z"
}
