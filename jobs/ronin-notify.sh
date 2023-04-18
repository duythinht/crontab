#!/bin/bash

set -e

source 'lib/coin.sh'
source 'lib/telegram.sh'
source 'lib/math.sh'
source 'lib/state.sh'
source 'lib/chatgpt.sh'

data=$(coin.get "ronin")

current_price=$(coin.data.current_price "$data")

message=$(chatgpt.fmt.message "$data")

for id in $(echo $TELEGRAM_CHAT_ID | tr -d ' ' | tr "," "\n")
do
    telegram.send_message $id "$message"
    echo "message has been sent to $id"
done

state.set $LAST_PRICE_KEY $current_price