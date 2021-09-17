#!/bin/bash
# Get the links stripping gateway
links=$(curl --silent -H "Accept: application/vnd.github.v3+json" "https://api.arching-kaos.com/shows" | json_pp | grep ipfs | awk '{print $3}' | sed -e "s/\"//g"|sed -e 's/,//g' | sed -e 's/https\:\/\/ipfs.arching-kaos.com//g')

for line in $links;do  ipfs pin add $line; done
