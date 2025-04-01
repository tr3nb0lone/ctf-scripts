#!/usr/bin/env bash


# script wrapper to automatically scan targets:

# todo:  implement a domain name extraction + automatic modification of the hosts file, implement support for udp scans

rustscan -a $1 --ulimit 5000 -- -sCV -T4 -Pn -oN nmap

