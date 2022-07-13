#!/bin/bash

runtime="57 minute"
endtime=$(date -ud "$runtime" +%s)

while [[ $(date -u +%s) -le $endtime ]]
do
    echo "jam crot: `date`"
    echo "Sleeping for 1 minute"
    sleep 1m
done
