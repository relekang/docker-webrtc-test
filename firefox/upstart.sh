#!/usr/bin/env bash
export LOG_FILE=/var/log/browser-xvfb.log
export DISPLAY=:10

Xvfb :10 -screen 0 1366x768x24 -ac +extension RANDR & > ${LOG_FILE} \
echo "$1 ($2)"
node /opt/selenium/runner.js $1 $2
