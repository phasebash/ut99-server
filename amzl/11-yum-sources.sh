#!/usr/bin/env bash
set -eu

sudo yum install -y -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum-config-manager --enable epel
