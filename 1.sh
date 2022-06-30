#!/usr/bin/env bash

source ".env.commit_message_regexp"
set -o xtrace  # debug
message="fix(ui): broken /security/activity-log (BASE-1469)\n\n- disable ajax timing"

readarray -t $message
for MESSAGE_COMMITS in "${LIST_MESSAGE_COMMITS[@]}"
do
  if ! [[ ${MESSAGE_COMMITS} =~ ${COMMIT_MESSAGE_REGEXP} ]]; then
    echo "Invalid message commit:"
    echo "${MESSAGE_COMMITS}"
    exit 1
  fi
done