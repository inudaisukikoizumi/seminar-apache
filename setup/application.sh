#!/bin/bash -ex
export DEBIAN_FRONTEND=noninteractive

# update
apt-get update -qq

# timezone
echo "Asia/Tokyo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# git
apt-get install -y git-core

# misc
apt-get install -y man

# vim
apt-get install -y vim
