# Lab 4 Submission

## About us

- Group number: 1
- Section: IV-DCSAD
- Group IAM user: dcsad-g01
- DynamoDB table name: umak-elec3-dcsad-g01-messages
- HTTP API name: umak-elec3-dcsad-g01-api

## Handler code

```python
import base64
import json
import uuid
from datetime import datetime, timezone

import boto3
from botocore.exceptions import ClientError

GROUP_NAME = "Group 1 of IV-DCSAD"
DEFAULT_AUTHOR = "Glenn Leenard L. Rodriguez (Group 1 of IV-DCSAD)"
TABLE_NAME = "umak-elec3-dcsad-g01-messages"
MAX_TEXT_LENGTH = 280
MAX_AUTHOR_LENGTH = 80

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(TABLE_NAME)


def respond(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body, default=str),
    }


def parse_body(event):
    raw_body = event.get("body") or "{}"
    if event.get("isBase64Encoded"):
        raw_body = base64.b64decode(raw_body).decode("utf-8")
    data = json.loads(raw_body)
    if not isinstance(data, dict):
        raise ValueError("Request body must be a JSON object.")
    return data


def get_messages():
    items = table.scan().get("Items", [])
    items.sort(key=lambda item: item.get("createdAt", ""))
    return respond(200, items)


def create_message(event):
    try:
        data = parse_body(event)
    except (ValueError, TypeError):
        return respond(400, {"error": "Send a JSON body with a text field."})

    text = str(data.get("text") or "").strip()
    if not text:
        return respond(400, {"error": "Send a JSON body with a text field."})
    if len(text) > MAX_TEXT_LENGTH:
        return respond(400, {"error": f"Keep the text at {MAX_TEXT_LENGTH} characters or fewer."})

    author = str(data.get("author") or DEFAULT_AUTHOR).strip()[:MAX_AUTHOR_LENGTH]
    message = {
        "id": str(uuid.uuid4()),
        "author": author,
        "text": text,
        "createdAt": datetime.now(timezone.utc).isoformat(),
    }

    table.put_item(Item=message)
    return respond(201, message)


def lambda_handler(event, context):
    route = event.get("routeKey")

    try:
        if route == "GET /messages":
            return get_messages()
        if route == "POST /messages":
            return create_message(event)
        return respond(404, {"error": f"No route for {route}"})
    except ClientError as exc:
        return respond(500, {"error": exc.response["Error"]["Message"]})
