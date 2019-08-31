#!/bin/bash

#####################################################################################

# FIREWALLS AND IDS

# IN ORDER TO EVADE OR DETECTED A FIREWALL, YOU NEED TO UNDERSTAND
# WHAT KIND OF RULES ARE APPLIED ON IT:
# YOU CAN START WITH A SIMPLE TCP SYN SCAN,

echo '[*] Example Scan: NMAP Scripting Engine (-sC)';
echo '[*] Scanning: nmap -T4 -p80,443 -sC scanme.nmap.org';
nmap -T4 -p80,443 -sC scanme.nmap.org;
sleep 2s;
echo -e "\n\n";

#####################################################################################
