#!/usr/bin/env bash
set -eu

/home/ut99/ut-server/ucc.init start

PID=$(cat /home/ut99/ut-server/System/ucc.init.lock)
echo "PID is ${PID}"

while kill -0 $PID 2> /dev/null; do
    sleep 1
done