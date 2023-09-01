#!/bin/bash
# set noninteractive installation
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get -yq update
apt-get -yq upgrade
apt-get -yq install tzdata
# set your timezone
dpkg-reconfigure --frontend noninteractive tzdata
apt-get -yq install $(cat /tmp/requirements-apt.txt | tr '\n' ' ')


