#!/bin/bash

set -e

source 'lib/slack.sh'

export LC_ALL=en_US.UTF-8

slack.send_message $SLACK_CHANNEL "Chào bủi sáng, cốt chưa anh em? Chưa code thì qua #music nghe nhạc nhé!"