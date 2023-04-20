#!/bin/bash

set -e

source 'lib/coin.sh'
source 'lib/telegram.sh'
source 'lib/math.sh'
source 'lib/state.sh'
source 'lib/chatgpt.sh'

export LC_ALL=en_US.UTF-8

data=$(coin.get "ronin")

current_price=$(coin.data.current_price "$data")

message=$(coin.fmt.notify_price "$data")

echo $message

exit 1

for id in $(echo $TELEGRAM_CHAT_ID | tr -d ' ' | tr "," "\n")
do
    telegram.send_message $id "$message"
    echo "message has been sent to $id"
done

state.set $LAST_PRICE_KEY $current_price