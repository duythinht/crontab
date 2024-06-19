#!/bin/bash

set -e

source 'lib/slack.sh'

export LC_ALL=en_US.UTF-8

slack.send_message $SLACK_CHANNEL "Chào bủi sáng, sẵn sàng nhảy việc chưa anh em? Rồi thì chơi ít <#C0UQ8TKLJ|music> trong lúc giải vài bài <#C6XNQB6LB|algorithm> nhé! https://radio.0x97a.com/"
