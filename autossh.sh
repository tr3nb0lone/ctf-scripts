#!/usr/bin/env bash

BOX=$1
IP=$2

ssh-keygen -f ~/keys/key_"$BOX" -N ''

