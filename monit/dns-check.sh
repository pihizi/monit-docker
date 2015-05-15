#!/bin/bash

digMe() {
    host=$1
    dig @localhost $host
    status=$?
    if [ $status > 0 ]; 
    then
        echo "can not reach host $host"
        exit $status
    fi
}

dnsfile="/data/monit/dns.records"
if [ ! -f $namefile ];
then
    exit 0;
fi

while read -r name
do
    digMe $name
done < $dnsfile
