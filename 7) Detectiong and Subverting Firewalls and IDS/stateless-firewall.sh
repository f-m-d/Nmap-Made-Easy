#!/bin/bash

#####################################################################################

# A SIMPLE, STATELESS, HOST-BASED FIREWALL SCRIPT



# FLUSH AND DELETE ANY EXISTING TABLES
#
# -F 			DELETE RULES AND CHAINS, ONE BY ONE
# -X			DELETE USE DEFINE CHAINS

iptables -F;
iptables -X;



# DENY BY DEFAULT (INPUT/FORWARD)

iptables --policy INPUT DROP;
iptables --policy OUTPUT ACCEPT;
iptables --policy FORWARD DROP;



# I WANT TO MAKE SSH AND WWW ACCESSIBLE FROM OUTSIDE
#
# -A 						APPEND THE RULE TO THE END OF THE CHAIN
# -m 						SPECIFY A MATCH TO USE (AS EXTENSION MODULE) FOR TEST SOME KIND OF PROPERTY
# -p 						SPECIFY THE PROTOCOL TO USE (E.G. TCP, UDP, ICMP)
# --destination-port		SPECIFY THE DESTINATION PORT
# -j						SPECIFY THE TARGET OF THE RULE 

iptables -A INPUT -m multiport -p tcp --destination-port 22,80 -j ACCEPT;



# ALLOW RESPONSES TO OUTGOING TCP REQUESTS

iptables -A INPUT -p tcp ! --syn -j ACCEPT;



# THE FIREWALL IS STATELESS: THERE IS NO "--state" OPTION OR "-m state"

#####################################################################################
