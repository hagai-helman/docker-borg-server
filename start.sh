#!/bin/bash

if test -f "/.first-run"; then
	groupadd -g ${PGID:=1000} ${USERNAME:=user}
	useradd -u ${PUID:=1000} -g ${PGID:=1000} ${USERNAME:=user}
	echo ${USERNAME:=user}:${PASSWORD:=password} | chpasswd
	mkdir /home/${USERNAME:=user}
	ln -s /repos /home/${USERNAME}/repos
	rm /.first-run
fi
service ssh start > /dev/null &
while true; do sleep 1; done
