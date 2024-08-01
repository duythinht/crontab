#!/bin/bash

set -e

source 'lib/slack.sh'

export LC_ALL=en_US.UTF-8

slack.send_message $SLACK_CHANNEL "Chào bủi sáng, cốt chưa ae? Chưa thì nghe nhạc trong <#C0UQ8TKLJ|music> nhé! https://radio.0x97a.com/"
