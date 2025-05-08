#!/usr/bin/env python

from ldap3 import *
import sys

IP = sys.argv[1]

s = Server(IP, get_info=ALL)

# anonymous bind
c = Connection(s, '', '')

if c.bind():
    print("Anonymous bind successfull!")
    print(s.info)
else:
    print("Anonymous  bind might not be successful!!")

# gracefully exit.
