#!/bin/bash

#####################################################################################

# FIREWALLS AND IDS

# IN ORDER TO EVADE OR DETECTED A FIREWALL, YOU NEED TO UNDERSTAND
# WHAT KIND OF RULES ARE APPLIED ON IT:
# YOU CAN START WITH A SIMPLE TCP SYN SCAN, AND TRY WITH OTHER SCANS.
# USING HPING AND --scanflag CAN HELP THE EVASION

echo '[*] Example Scan: NMAP TCP SYN Scan (-sS)';
echo '[*] Scanning: nmap -T4 -sS scanme.nmap.org';
nmap -T4 -sS scanme.nmap.org;
echo "[*] There are filtered ports: can't be reached with TCP SYN Scan!";
sleep 2s;
echo -e "\n\n";

# ACK SCAN CAN SHOW IF A FIREWALL IS STATEFULL:
# FIREWALLS MUST STATEFULLY WATCH EVERY ESTABLISHED CONNECTION
# TO KNOW IF A CONNECTION HAS BEEN PREVIOUSLY ESTABLISHED

echo '[*] Example Scan: NMAP TCP ACK Scan (-sA)';
echo '[*] Scanning: nmap -T4 -sA scanme.nmap.org';
nmap -T4 -sA scanme.nmap.org;
echo "[*] There are filtered ports: can't be reached with TCP SYN Scan!";
sleep 2s;
echo -e "\n\n";


## SEE THE EXAMPLE STATELESS-FIREWALL.SH FOR MORE INFO ##

# IP ID TRICKS:
# THE ID FIELD IN IP HEADERS LEAVE A LOT OF INFORMATION.
# LEARN TO DISCERN WHAT SOURCE ADDRESSES MAKE IT TROUGH THE FIREWALL.
# 
# YOU CAN TEST THIS CONDITION WITH "hping":

# 1)	FIND AT LEAST ONE ACCESSIBLE (OPEN/CLOSED) PORT
# 		OF AN INTERNAL MACHINE ON THE NETWORK
#		(E.G.: WINDOWS BOXES, ROUTERS, PRINTERS)
#		LINUX/SOLARIS/OPENBSD HAVE LARGELY RESOLVED
#		THE IP ID SEQUENCE NUMBERS.
#		TRY THE ONE WITH LESS TRAFFIC POSSIBLE.
#
# 2)	VERIFY IF THE MACHINE HAS PREDICTABLE IP ID SEQUENCES.
#		
#		# E.G. REQUEST 5 SYN PACKET TO PORT 80, ONE SECOND APART
		hping3 -c 5 -i 1 -p 80 -S






#####################################################################################
