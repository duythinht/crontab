#!/bin/bash

function telegram.send_message { # chat_id message
curl -X POST \
     -H 'Content-Type: application/json' \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage \
    -d  @- << EOF 
{
    "chat_id": "$1", 
    "text": "$2",
    "parse_mode": "markdown",
    "disable_notification": true
}
EOF
}
