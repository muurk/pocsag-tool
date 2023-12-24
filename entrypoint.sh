#!/bin/bash

address=000000
message="test holding message"

while getopts a:m: flag
do
    case "${flag}" in
        a)
          address=${OPTARG}
        ;;
        m)
          message=${OPTARG}
        ;;
    esac
done

/usr/bin/pocsac -a $address -m "$message" -f - | /usr/bin/bin2audio -i - -o - | sox -t raw -esigned-integer -b16 -r 48000 - -t raw -esigned-integer -b16 -r 22050 -
