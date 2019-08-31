#!/bin/bash

#####################################################################################

# NMAP SCRIPTING ENGINE

# NMAP SCRIPTING ENGINE ALLOW PEOPLE TO WRITE AND SHARE SIMPLE SCRIPT
# TO AUTOMATE A WIDE VARIETY OF TASKS.
# THIS SCRIPT ARE EXECUTED IN PARALLEL AND EFFICIENCY
# 
# NSE IS DESIGNED TO BE VERSATILE AND WITH THE FOLLLOWING TASKS IN MIND:
# NETWORK DISCOVERY, STRONGER OS DETECTIONS, VULNERABILITY DEDUCTION AND EXPLOITATION, BACKDOOR DEDUCTION.
#
# THE SCRIPTS ARE WRITTEN IN "LUA" PROGRAMMING LANGAUGE.
# https://www.lua.org/pil/contents.html
#
# YOU CAN ACTIVATE THE SCRIPTING ENGINE WITH THE "-sC" ARGUMENT.
# IF YOU WISH TO SPECIFY A CUSTOM SERVICE/HOST SCRIPT, USE "--script"
#
# SERVICE SCRIPT ARE RELATED TO A CERTAIN PORT (SERVICE),
# HOST SCRIPT RUN ONCE FOR EVERY IP SCANNED.

echo '[*] Example Scan: NMAP Scripting Engine (-sC)';
echo '[*] Scanning: nmap -T4 -p80,443 -sC scanme.nmap.org';
nmap -T4 -p80,443 -sC scanme.nmap.org;
sleep 2s;
echo -e "\n\n";

#####################################################################################
