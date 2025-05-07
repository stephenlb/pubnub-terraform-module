# Create Event Listener

### Request URL
https://admin.pubnub.com/api/keysets/\<SUBSCRIBE\_KEY\>/event-listeners

### Request Method
POST

### Post Body
{"name":"Event listener 1","category":"message","type":"Producer.Messages.PubSub","filterStrategy":{"type":"none"},"actions":[{"id":"290dd25e-dd28-4b18-a3d9-9ef97bf7e60d","subscribeKey":"sub-c-5f2d0e5c-303b-4dca-aa0a-f87fbedaef45","name":"Action 1","category":"webhook","version":"1","status":"on","createdAt":"2025-05-02T20:02:24.830Z","updatedAt":"2025-05-02T20:02:24.830Z","configuration":{"target":"https://www.pubnub.com/docs/serverless/functions/functions-apis/xhr-module","BatchConfig":{"ttlSeconds":5,"maxNumParts":100,"maxBytesSize":5000000,"batchingEnabled":false},"retryEnabled":true,"maxNumRetries":2,"retryInterval":450,"additionalHeaders":{"header":"value"},"outputMessageFormatConfig":{"isEnveloped":true,"envelopeVersion":"2.1"}},"eventListeners":[]}],"eventType":"pubnub.com/schemas/events/messages.pubsub.publish?v=1.0.0"}

### Response
{
    "subscribeKey": "\<SUBSCRIBE\_KEY\>",
    "accountId": 453847,
    "name": "Event listener 1",
    "category": "message",
    "type": "Producer.Messages.PubSub",
    "eventType": "pubnub.com/schemas/events/messages.pubsub.publish?v=1.0.0",
    "actions": [
        {
            "id": "290dd25e-dd28-4b18-a3d9-9ef97bf7e60d"
        }
    ],
    "updatedAt": "2025-05-02T20:06:30.994Z",
    "id": "99d50d09-5908-489a-ba50-f899130c8cf2",
    "status": "on",
    "createdAt": "2025-05-02T20:06:30.994Z",
    "filterStrategy": {
        "type": "none"
    }
}
