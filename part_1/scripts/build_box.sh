#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error missing virtual machine name"
    exit 1
fi


VIRTUAL_MACHINE="$1"

cd ../boxes
vagrant package --base $VIRTUAL_MACHINE