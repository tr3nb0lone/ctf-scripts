#!/usr/bin/env bash

IP="$1"
VHOST="$2"

# yet-another-ffuf-wrapper, auto-calibrate, faster result and output.
ffuf -u http://$IP -H "Host: FUZZ.$2" -w /usr/share/seclists/Discovery/DNS/namelist.txt -t 70 -ac -o vhosts.json -c

