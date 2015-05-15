#!/bin/bash

namefile="/data/monit/docker.records"

if [ ! -f $namefile ];
then
    exit 0;
fi

while read -r name
do
    docker top $name;
    status=$?;
    if [ $status > 0 ];
    then
        echo "docker container $name is not start"
        exit $status;
    fi
done < $namefile

exit 0;
