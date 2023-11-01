#!/bin/bash

function slack.send_message { # chat_id message
curl -X POST \
     -H "Content-Type: application/json; charset=utf-8" \
     -H "Authorization: Bearer $SLACK_TOKEN" \
     https://slack.com/api/chat.postMessage \
    -d  @- << EOF 
{
    "channel": "$1", 
    "text": "$2"
}
EOF
}
