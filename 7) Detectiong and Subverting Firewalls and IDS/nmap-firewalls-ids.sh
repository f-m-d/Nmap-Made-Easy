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

echo '[*] Example Hping3: IP ID Packets check';
echo '[*] Sending: hping3 -c 5 -i 1 -p 80 -S <HOST_TARGET>;';
echo "[*] PS: Replace the <HOST_TARGET> WITH A REAL IP OR DOMAIN";
hping3 -c 5 -i 1 -p 80 -S 192.168.1.1;
sleep 2s;
echo -e "\n\n";




# 3) 	SPOOF YOUR HOST (WITH A ONE CLOSER TO THE TARGET)
# 		AND TRY TO LISTEN AGAIN TO THE HOST.

echo '[*] Example Hping3: Spoofing and sending packets';
echo '[*] Sending: hping3 --spoof <SPOOFED_HOST> --fast -p 80 -c 1000 -S <HOST_TARGET>';
echo "[*] PS: Replace the <HOST_TARGET> AND <SPOOFED_HOST>";
hping3 --spoof 127.0.0.1 --fast -p 80 -c 1000 -S 192.168.1.1;
echo '[*] Example Hping3: IP ID Packets check';
echo '[*] Sending: hping3 -c 5 -i 1 -p 80 -S <HOST_TARGET>;';
hping3 -c 5 -i 1 -p 80 -S 192.168.1.1;
sleep 2s;
echo -e "\n\n";



# 4)	REPEAT THE (3) FOR NETWORKS LIKE:
#		192.168.0.0/16, 172.16.0.0/12, 10.0.0.0/8
#		THIS WAY YOU WILL NOW WHAT IP ARE USED INTERNALLY OR TRUSTED



#####################################################################################



# EXOTIC SCANS: NULL, FIN, XMAS, MAIMON AND WINDOWS

# THOSE SCANS CAN BE VALUABLE TO BREACH INTO FIREWALLS OR BYPASS IDS



#####################################################################################

# UDP SCAN

# UDP HAS A PROBLEM: PORTS ARE SHOWN AS OPEN/FILTERED BECAUSE THEY
# DON'T ANSWER BACK TO THE PROBES.
# A BETTER WAY IS TO USE A VERSION SCAN ASSOCIATED WITH UDP SCAN:


echo '[*] Example Scan: NMAP UDP Version Scan (-sU, -sV)';
echo '[*] Scanning: nmap -sU -sV -p50-60 -scanme.nmap.org';
nmap -sU -sV -p50-60 -scanme.nmap.org;
echo "[*] There are filtered ports: can't be reached with TCP SYN Scan!";
sleep 2s;
echo -e "\n\n";



#####################################################################################

# SOURCE PORT MANIPULATION

# SOME FIREWALLS ALLOW TRAFFIC ON DEFINED PORTS (E.G. DOMAIN/53 SSH/22 ETC.)
# YOU CAN EXPLOIT THIS WEAKNESS WITH "-g" / "--source/port" OPTION:

echo '[*] Example Scan: NMAP TCP SYN on port Scan (-g)';
echo '[*] Scanning: nmap -sS -v -Pn -g 80 scanme.nmap.org';
nmap -sS -v -Pn -g 80 scanme.nmap.org;
echo "[*] There are filtered ports: can't be reached with TCP SYN Scan!";
sleep 2s;
echo -e "\n\n";



#####################################################################################



# IP FRAGMENTATION

# YOU CAN TRY WITH TINY IP FRAGMENTS USING THE "-f" OPTION:
# IT ADD UP TO 8 BYTES OF DATA IN EACH FRAGMENT.
# YOU STACK IT: -f -f ALLOWUP TO 16 BYTES OF DATA AS AN ARGUMENT.
# YOU CAN USE THE "--mtu" OPTION AND GIVE THE MAXIMUM DATA BYTES AS AN ARGUMENT.
# THE "--mtu" ARGUMENT MUST BE A MULTIPLE OF 8

echo '[*] Example Scan: NMAP TCP SYN on port Scan (-g)';
echo '[*] Scanning: nmap -sS -v -Pn -g 80 scanme.nmap.org';
nmap -sS -v -Pn -g 80 scanme.nmap.org;
echo "[*] There are filtered ports: can't be reached with TCP SYN Scan!";
sleep 2s;
echo -e "\n\n";



#####################################################################################



# MAC SPOOFING

# NMAP HAS A FILE CALLED "nmap-mac-prefixes" TO KNOW THE VENDOR OF THE MACHINE.
# YOU CAN SNIFF AND SPOOF YOU MAC ADDRESS AS ANOTHER PC OF THE NET.
# OPTIONS LIKE "-spoofmac" CAN HELP OR EVEN DECEIVE:
# --spoofmac (Apple/M:A:C:A:D:D:R)



#####################################################################################



# SOURCE ROUTING

# THE "--ip-options" LET YOU REQUEST PACKETS TO BE SOURCE ROUTED
# E.G. "--ip-options "L 192.168.1.7 192.168.1.8" REQUEST THAT PACKETS
# TO BE LOOSE SOURCE ROUTED TROUGH THE 2 IP ADDRESSES.



#####################################################################################



# FTP BOUNCE SCAN

# LAST BUT NOT LEAST, YOU CAN DO A FTP BOUNCE SCAN (-b)
# IT IS HIGHLY FIXED, BUT TRYING DOESN'T COST AT ALL



#####################################################################################