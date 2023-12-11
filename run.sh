#!/bin/sh

if [[ -z "$root_pw" ]]
then
    root_pw=test123
fi

echo "root:${root_pw}" | chpasswd

/sbin/tini -s /usr/bin/ssh.sh
