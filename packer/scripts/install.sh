#!/usr/bin/env bash
set -e
set -u
set -x

cp /tmp/motd /etc/motd
apt-get update
