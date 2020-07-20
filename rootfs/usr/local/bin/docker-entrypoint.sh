#!/bin/bash -xe

apt-get update && apt-get install -y openssh-server=1:${SSHD_VERSION}*
dpkg-reconfigure openssh-server

/usr/sbin/sshd $@
