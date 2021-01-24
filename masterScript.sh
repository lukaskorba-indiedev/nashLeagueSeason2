#!/bin/bash
now=$(date +"%b_%d_%T")

sh ./getData.sh "$now"

sleep 10

./processData "$now"
