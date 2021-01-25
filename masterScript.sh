#!/bin/bash
now=$(date +"%b_%d_%H-%M")

sh ./getData.sh "$now"

./processData "$now"
