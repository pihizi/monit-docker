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
        docker start $name;
        status=$?;
        if [ $status > 0 ];
        then
            echo "start docker container $name failed"
            exit $status;
        fi
    fi
done < $namefile

exit 0;
