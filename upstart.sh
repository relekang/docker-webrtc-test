#!/usr/bin/env bash
export URL=http://aberforth.lkng.me
export LOG_FILE=/var/log/chrome-headless.log
export DISPLAY=:10

Xvfb :10 -screen 0 1366x768x24 -ac +extension RANDR & > ${LOG_FILE} \
node /opt/selenium/runner.js
#/usr/sbin/sshd -D
