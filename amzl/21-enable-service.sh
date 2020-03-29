#!/usr/bin/env bash
set -eu

sudo mv /tmp/utserver.service /etc/systemd/system/utserver.service
sudo chown root:root /etc/systemd/system/utserver.service
sudo systemctl enable utserver.service