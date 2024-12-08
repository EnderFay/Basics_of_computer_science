#!/bin/bash

disk_usage(){
    local directory="$1"
    local excess="$2"

    local usage_percent=$(df -h "$directory" | awk 'NR==2 {print $5}' | sed 's/%//')

    echo "$directory takes: $usage_percent%"

    if [ "$usage_percent" -gt "$excess" ];
    then
	echo "WARNING! Usage exceeds specified process ${excess}%!"
    else
	echo "Everything is fine"
    	fi
}

directory="$1"
excess="$2"

if [ ! -d "$directory" ]
    then
    echo "Try another directory"
    exit 1
fi

disk_usage "$directory" "$excess"
