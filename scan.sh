#!/usr/bin/env bash


# nmap script wrapper to automatically scan targets:
# Redirects rustscan's output to nmap:
# todo:  implement a domain name extraction + automatic modification of the hosts file, implement support for udp scans

rustscan -a $1 --ulimit 5000 -- -sCV -Pn -oN nmap


