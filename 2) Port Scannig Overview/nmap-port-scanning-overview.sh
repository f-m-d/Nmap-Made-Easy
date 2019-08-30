#!/bin/bash

# PORT SCANNING: INTRO
#
# YOU CAN SEE PORTS AS VIRTUAL CHANNELS WHERE PROGRAM CAN
# COMUNICATE.
# EXAMPLES ARE TCP/80 HTTP TCP/443 HTTPS FOR TCP PACKETS
# AND UDP/53 DOMAIN OR UDP/22 SSH FOR UDP PACKETS
#
# THE TCP/UDP PACKETS JUST ADD AN HEADER WITH
# SOURCE/DESTINATION IP AND SOURCE/DESTINATION PORT.
#
# YOU CAN READ THE nmap-services FILE TO FIND MORE:


echo '[*] You can see all the TCP/UDP Port used';
echo '[*] They are locate in the "nmap-services" file';
echo '[*] Example: find /usr/share/nmap -name "nmap-services"';
find /usr/share/nmap -name "nmap-services" 2> /dev/null;
sleep 2s;
echo -e "\n\n";



# YOU CAN SEE YOUR PORT RANGE IN "ip_local_port_range" (LINUX)

echo '[*] You can see your PORT RANGE!!';
echo '[*] It is locate in "ip_local_port_range" file';
echo "[*] Look at /proc/sys/net/ipv4/ip_local_port_range";
echo '[*] Example: find /proc/sys/net/ipv4/ -name "ip_local_port_range"';
find /proc/sys/net/ipv4/ -name "ip_local_port_range" 2> /dev/null;
echo '[*] Example: cat /proc/sys/net/ipv4/ip_local_port_range';
echo '[*] (PS: YOU CAN MODIFY THIS RANGE!!!)';
cat /proc/sys/net/ipv4/ip_local_port_range;
sleep 2s;
echo -e "\n\n";



# THE IANA (INTERNET ASSIGNED NUMBER AUTHORITY)
# HAS THEIR OWN PORT CLASSIFICATION SCHEME,
# DIVIDES IN THREE CATEGORY:
#
# https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml
#
# FIRST CATEGORY: WELL-KNOWN PORTS (0-1023)
# RESERVED PORT FOR WELL-KNOWN SERVICES, AS HTTP/S OR SSH.
# 
# SECOND CATEGORY: REGISTERED PORTS (1024-49151)
# THE PORTS ARE LESS KNOWN THAN WELL-KNOWN PORTS,
# THE MAIN DIFFERENCE IS THAT UNPRIVILEGED USERS CAN
# BIND TO THESE PORTS AND RUN THE SERVICE
# IN THEIR REGISTERED PORT
#
# THIRD CATEGORY: DYNAMIC AND/OR PRIVATE (45152-65535)
# THE IANA REVERVES THIS PORTS FOR DYNAMIC USES.
# E.G. IF YOU SET PORT 0, MOST OS WILL ALLOCATE ONE OF
# THIS PORTS: IT MEAN "CHOOSE AN OPEN PORT"

###########################################################

# COMMON PORTS: TCP
# 
# 21/FTP				FILE TRANSFER PROTOCOL (INSECURE)
# 22/SSH				SECURE SHELL (REMOTE SESSION, SECURE)
# 23/TELNET				TELNET (REMOTE SESSION, INSECURE)
# 25/SMTP				STANDARM MAIL TRANSFER PROTOCOL (INSECURE)
# 53/DOMAIN				DOMAIN NAME SYSTEM (DNS) (INSECURE)
# 80/HTTP 				HTTP (INSECURE)
# 110/POP3				POST OFFICE PROTOCOL 3 FOR EMAIL RETRIEVAL (INSECURE)
# 111/RPCBIND			MAPS SUNRPC PROGRAM NUMBERS TO THEIR TCP/UDP PORT NUMBERS
# 135/MSRPC				MICROSOFT REMOTE PROCEDURE CALL
# 139/NETBIOS-SSN		NETBIOS SESSION SERVICE (WITH MS WINDOWS SERVICES) FILE/PRINTER SHARING
# 143/IMAP				INTERNET MESSAGE ACCESS PROTOCOL 2 (EMAIL, INSECURE)
# 443/HTTPS 			SSL ENCRYPTED HTTP (SECURE)
# 445/MICROSOFT-DS		SMB COMMUNICATION OVER IP (WITH MS WINDOWS SERVICES) FILE/PRINTER SHARING
# 993/IMAPS				IMAP2 WITH SSL (SECURE)
# 995/POP3S				POP3 WITH SSL (SECURE)
# 1723/PPTP				POINT-TO-POINT TUNNELING PROTOCOL (FOR VPN, SOMETIMES REQUIERED FOR ISPs BROADBAND CONNECTIONS)
# 3306/MYSQL			MYSQL DATABASE
# 3389/MS-TERM-SERVER	MICROSOFT TERMINAL SERVICES ADMINISTRATION
# 5900/VNC				VIRTUAL NETWORK COMPUTING (DESKTOP SHARING, INSECURE)
# 8080/HTTP-PROXY		HTTP PROXIES (OR ALTERNATIVE TO 80 PORT)

echo '[*] Example Scan: Common TCP Ports ';
echo '[*] Scanning: nmap -PS21,22,23,25,110,111,135,139,143,443,445,993,995,1723,3306,3389,5900,8080 -PA80,443 192.168.1.1';
nmap -PS21,22,23,25,110,111,135,139,143,443,445,993,995,1723,3306,3389,5900,8080 -PA80,443 192.168.1.1;
sleep 2s;
echo -e "\n\n";



# COMMON PORTS: UDP
#
# 53/DOMAIN				DOMAIN NAME SYSTEM (DNS) (INSECURE)
# 67/DHCPS				DYNAMIC HOST CONFIGURATION PROTOCOL SERVER (GIVES IP ADDRESS TO HOSTS)
# 68/DHCPC				DHCP CLIENT
# 69/TFTP				TRIVIAL FILE TRANSFER PROTOCOL
# 123/NTP				NETWORK TIME PROTOCOL
# 135/MSRPC				MICROSOFT REMOTE PROCEDURE CALL
# 137/NETBIOS-NS 		NETBIOS NAME SERVICE
# 138/NETBIOS-DGM		NETBIOS DATAGRAM SERVICE
# 139/NETBIOS-SSN		NETBIOS SESSION SERVICE (WITH MS WINDOWS SERVICES) FILE/PRINTER SHARING
# 161/SNMP 				SIMPLE NETWORK MANAGEMENT PROTOCOL
# 162/SNMPTRAP			SNMP TRAP (AB SMTP AGENT USES 161 AND A SMTP MANAGER USES 162)
# 445/MICROSOFT-DS		SMB COMMUNICATION OVER IP (WITH MS WINDOWS SERVICES) FILE/PRINTER SHARING
# 500/ISAKMP			INTERNET SECURITY ASSOCIATION AND KEY MANAGEMENT PROTOCOL (TO SETUP VPN IPSEC ETC.)
# 514/SYSLOG			STANDARD UNIX LOG DAEMON
# 520/RIP 				ROUTING INFORMATION PROTOCOL
# 631/IPP 				INTERNET PRINT PROTOCOL
# 1434/MS-SQL-DS		MICROSOFT SQL SERVER
# 1900/UPNP				MICROSOFT SIMPLE DEVICE DISCOVERY PROTOCOL (DISCOVERY OF UNIVERSAL PLUG-AND-PLAY DEVICES)
# 4500/NAT-T-IKE		NEGOTIATING NETWORK ADDRESS TRANSLATION TRASVERSAL WHILE INITIATING IPSEC CONNECTION (USING INTERNET KEY EXCHANGE)
# 49152/UNKNOWN			FIRST OF DYNAMIC/PRIVATE PORTS

echo '[*] Example Scan: Common UDP Ports ';
echo '[*] Scanning: nmap -PU53,67-69,123,135,137-139,161,162,445,500,514,520,631,1434,1900,4500,49152 192.168.1.1';
nmap -PU53,67-69,123,135,137-139,161,162,445,500,514,520,631,1434,1900,4500,49152 192.168.1.1;
sleep 2s;
echo -e "\n\n";



###########################################################

# PORT SCANNING: REASONS TO SCAN

# PORT SCANNING IS THE ACT TO SCAN PORT TO DETERMINE WHAT THE STATE THEY ARE.
# NMAP SHOW THE PORTS IN 6 POSSIBLE STATUS:
#
# OPEN:
# THE APPLICATION ON THAT PORT IS ACCEPTING THE TCP/UDP PACKETS.
# ATTACKERS WANT TO OPEN AND OPEN PORTS, SYSADMIN WANT TO CLOSE THE UNUSED ONE.
# CARE: SOME APPLICATIONS CAN BE PROTECTED WITH TCP WRAPEPRS (TCPD)
# OR CAN SERVE ONLY DEFINED IP ADDRESSES OR CLIENTS.
#
# CLOSED:
# THE PORT IS ACCESSIBLE, BUT THERE IS NO APPLICATION LISTENING ON IT.
# SYSADMIN CAN BLOCK THIS PORT WITH A FIREWALL TO LET NMAP SEE THEM AS "FILTERED".
#
# FILTERED:
# CAN NOT DETERMINE WHETER THE PORT IS OPEN BECAUSE PACKET FILTERING PREVENT PROBES TO REACH THE PORT.
# FILTERING SOMETIMES MEAN: FIREWALL DEVICE, ROUTER ROULES, HOST-BASED FIREWALL SOFTWARE.
# THEY CAN IGNORE THE PACKET AND DO NOT GIVE BACK A RESPONSE:
# THIS MAKE NMAP SEND MORE SCANS (JUST IN CASE THE PROBE WAS DROPPED BY NET CONGESTION)
#
# UNFILTERED:
# THE PORT IS ACCESSIBLE, BUT NMAP IS UNABLE TO DETERMINE IF THE PORT IS OPEN OR CLOSED.
# ONLY "ACK" SCANS CLASSIFIES PORT IN THIS STATE.
# SCANNING WITH OTHER SCANS (WINDOWS, SYN SCAN, FIN SCAN) CAN HELP TO KNOW MORE ABOUT.
#
# OPEN|FILTERED:
# THIS STATE MEANS THAT NMAP IS UNABLE TO KNOW IF IT IS OPEN OR FILTERED.
# IT IS USED FOR SCAN TYPES THAT GIVE NO REPONSE ON OPEN PORTS.
# THE UDP, IP, FIN, NULL, XMAS SCAN CLASSIFY PORTS THIS WAY.
#
# CLOSED|FILTERED
# THIS STATE MEANS THAT NMAP IS UNABLE TO KNOW IF IT CLOSED OR FILTERED.
# IT IS USED ONLY FOR IP ID IDLE SCAN.



###########################################################

# PORT SCANNING: QUICK PORT SCANNING

# THE EASIEST WAY TO DO AN NMAP SCAN IS TO DO AN "NMAP <ADDRESS>" SCAN.
# WHEN YOU DO "NMAP <ADDRESS>" WITHOUT ARGUMENTS, IT DOES:
#
# 1)	CONVERT <TARGET> IN A IPV4 USING DNS (IF IS A DOMAIN)
# 2)	PING WITH AN ICMP ECHO, TCP SYN 443, TCP ACK 80 AND ICMP TIMESTAMP.
# 		YOU CAN SKIP THIS PART WITH "-Pn" (THREAT ALL HOST AS ONLINE / SKIP HOST DISCOVERY)
# 3)	CONVERT THE IPV4 BACK TO THE DNS NAME: THE DNS NAME CAN BE DIFFERENT THAN
#		THE ONE SPECIFIED AT THE BEGINNING.
#		YOU CAN SKIP THIS PART WITH "-n" (DON'T DO DNS RESOLUTION)
# 4)	LAUNCH A TCP PORT SCAN ON THE MOST 1000 POPULAR PORTS LISTED IN "nmap-services" FILE.
#		A SYN STEALTH SCAN IS USUALLY USED FOR ROOT, AND A CONNECTION SCAN IS USED FOR NON-ROOT USERS
#		TO READ RAW PACKETS
# 5)	PRINT THE RESULTS IN HUMAN-READABLE OUTPUT AND EXITS.

echo '[*] Example Scan: Standard NMAP Scan';
echo '[*] Scanning: nmap scanme.nmap.org';
nmap scanme.nmap.org;
sleep 2s;
echo -e "\n\n";


# YOU CAN DO A MORE AGGRESSIVE SCAN, USING ARGUMENTS:
# -p0-			SCAN ALL PORTS
# -A 			OS DETECTION, VERSION, SCRIPT SCANNING AND TRACEROUTE
# -T4			DON'T EXCEED 10MS FOR A SINGLE PORT

echo '[*] Example Scan: Aggressive Scan (all ports)';
echo '[*] Scanning: nmap -p0- -v -T4 -A scanme.nmap.org';
nmap -p0- -v -T4 -A scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



###########################################################

# PORT SCANNING: FLAGS

#					"-sS"
# TCP SYN STEALTH SCAN, AND IT WORKS AGAINST ALL TCP STACKS
# IT SEND A "SYN" AND WAIT FOR RESPONSE:
#
# SYN+ACK:			OPEN
# RST:				CLOSED
# NO RESPONSE:		FILTERED

echo '[*] Example Scan: TCP SYN Stealth Scan (-sS)';
echo '[*] Scanning: nmap -sS scanme.nmap.org';
nmap -sS scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-sT"
# NMAP ASK UNDERLYING O.S. TO DO A CONNECTION
# USING THE "CONNECT" SYSTEM CALL.
# USEFUL WHEN THE USER IS NOT ROOT AND HAS NO ACCESS TO RAW PACKETS.
# IT WILL DO A COMPLETE TCP CONNECTION (CAN BE LOGGED)
# IF YOU CAN, USE A "-sS" SCAN.

echo '[*] Example Scan: TCP SYN Stealth Scan (-sT)';
echo '[*] Scanning: nmap -sT scanme.nmap.org';
nmap -sT scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-sU"
# A SIMPLE UDP SCAN TO THE PORTS SELECTED

echo '[*] Example Scan: UDP Scan (-sU)';
echo '[*] Scanning: nmap -sU scanme.nmap.org';
nmap -sU scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-sF,SN,sX"
# THIS SCANS ARE USED TO SNEAK PAST FIREWALLS TO EXPLORE SISTEMS BEHIND.
# THEY ARE A BIT MORE STEALTH THAN TCP SYN STEALTH SCAN.
#
# -sN:			TCP NULL SCAN: DOESN'T SET ANY BIT (LITTERALY SET TCP HEADER TO 0)
# -sF:			TCP FIN SCAN: SET THE TCP FIN BIT
# -sX:			TCP XMAS SCAN: SET TCP "FIN, PSH AND URG" FLAGS (LIGHTNING LIKE A XMAS TREE)

echo '[*] Example Scan: TCP NULL Scan (-sN)';
echo '[*] Scanning: nmap -sN scanme.nmap.org';
nmap -sN scanme.nmap.org;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: TCP FIN Scan (-sF)';
echo '[*] Scanning: nmap -sF scanme.nmap.org';
nmap -sF scanme.nmap.org;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: TCP XMAS Scan (-sX)';
echo '[*] Scanning: nmap -sX scanme.nmap.org';
nmap -sX scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-sA"
# TCP ACK SCAN: CAN BE USED TO CHECK FIREWALL RULES:
# IT HELPS TO UNDERSTAND IF PORTS ARE STATEFUL OR NOT.
# CAN'T DISTINGUISH OPEN FROM CLOSED PORTS.

echo '[*] Example Scan: TCP ACK Scan (-sA)';
echo '[*] Scanning: nmap -sA scanme.nmap.org';
nmap -sA scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-sW"
# TCP WINDOWS SCAN: IT IS LIKE TCP ACK SCAN
# BUT CAN HELP FOR SOME KIND OF WINDOWS MACHINE
# TO IDENTIFY IF A PORT IS OPEN OR CLOSED.

echo '[*] Example Scan: TCP Windows Scan (-sW)';
echo '[*] Scanning: nmap -sW scanme.nmap.org';
nmap -sW scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-sM"
# MAIMON SCAN: SET A TCP FIN/ACK FLAG:
# MOST OF SISTEMS SEND A RST PACKET IF THE PORT IS OPEN OR CLOSED.
# SOME DBS-DRIVEN OS DROP THE PACKET IF THE PORT IS OPEN.

echo '[*] Example Scan: TCP Maimon Scan (-sM)';
echo '[*] Scanning: nmap -sM scanme.nmap.org';
nmap -sM scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-sI <ZOMBIE-HOST>"
# TCP IDLE SCAN: THE STEALTHIEST SCAN TYPE OF ALL.
# IT IS COMPLEX AND SLOW
# https://nmap.org/book/idlescan.html.

echo '[*] Example Scan: TCP Idle Zombie Scan (-sI)';
echo '[*] Scanning: nmap -sI <HOST-ZOMBIE> scanme.nmap.org';
# nmap -sI <HOST-ZOMBIE> scanme.nmap.org
sleep 2s;
echo -e "\n\n";



#					"-sO"
# PROTOCOL SCAN THAT DETERMINES WHICH IP PROTOCOLS (ICMP,TCP, IGMP ETC.) ARE SUPPORTED
# BY THE ATTACKED HOST. THIS IS LITTERALY NOT A SCAN (IT CICLES THROUGH IP PROTOCOL NUMBERS THAN TCP/UDP NUMBERS)
# CAN USE THE "-p" OPTION TO SELECT PORTS AND REPORT AS A NORMAL SCAN CAN DO

echo '[*] Example Scan: IP Protocol Scan (-sO)';
echo '[*] Scanning: nmap -sO scanme.nmap.org';
nmap -sO scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



#					"-b username:password@server:port""
# TCP FTP BOUNCE SCAN: TRICKS FTP SERVERS INTO PERFORMING PORTS SCANS BY PROXY.
# ALMOST PATCHED EVERYWHERE, BUT TRYING DOESN'T COST MONEY, RIGHT?

echo '[*] Example Scan: TCP Idle Zombie Scan (-sI)';
echo '[*] Scanning: nmap -sI <HOST-ZOMBIE> scanme.nmap.org';
# nmap -sI <HOST-ZOMBIE> scanme.nmap.org
sleep 2s;
echo -e "\n\n";


###########################################################

# TIMING OPTIONS

# YOU CAN SET SOME TIME FLAGS TO ACTUALLY REDUCE THE AMOUNT OF TIME CONSUMED IN SCANS:



#					"-T0,..,T5"
# ADJUST NMAP SPEED FROM VERY SLOW (-T0) TO EXTREMELY AGGRO (-T5).
# CAN BE COMBINED WITH OTHER GRANULAR OPTIONS LIKE:
#
#	--min-rtt-timeout						SET THE MIN, MAX, AND INIT AMOUNT OF TIME
#	--max-rtt-timeout						NMAP WILL WAIT FOR A PORT SCAN PROBE RESPONSE
#	--initial-rtt-timeout
#
#	--host-timeout							ASK NMAP TO GIVE UP ON HOST THAT DELAY TO ANSWER	
#	--min-rate, --max-rate					SET THE MIN AND MAX NUMBER OF PROBE PACKETS NMAP SEND PER SECOND
#	--max-retries							SPECIFIES THE MAXIMUM NUMBER OF RETRY ON A SINGLE PORT
#	--min-hostgroup, --max-hostgroup		SET THE MIN AND MAX NUMBER OF HOST THAT NMAP CAN SCAN IN PARALLEL
#	--min-parralelism, --max-parallelism	LIMIT THE NUMBER OF PORT SCAN PROBES THAT NMAP CAN HAVE OUTSTANDING
#	--scan-delay, --max-scan-delay			ASK TO WAIT TO SEND A TIME TO SEND PROBES TO ANY INDIVIDUAL HOST.

###########################################################

# OUTPUT FORMAT AND VERBOSITY OPTION:

# NMAP SUPPORTS MANY OUTPUT OPTIONS, BUT THE MOST USED
# ARE THE NORMAL, XML AND GREAPABLE.
# EXISTS OTHER USEFUL OPTIONS OPTIONS:



#					"-v, -vv"
# ASK NMAP TO BE MORE VERBOSE, PRINTING MORE INFORMATION.
# YOU CAN BE EVEN MORE VERBOSE WITH "-vv"

echo '[*] Example Scan: Simple Scan with verbose option (-v)';
echo '[*] Scanning: nmap -v example.com';
nmap -v example.com;
sleep 2s;
echo -e "\n\n";



#					"-d, -dd"
# ASK NMAP TO PRINT AT DEBUGGING LEVEL: IT CAN BE AT MAX "-d9" LEVEL.
# YOU CAN USE "-dd" FOR A GREATER EFFECT.

echo '[*] Example Scan: Simple Scan with debug option (-d)';
echo '[*] Scanning: nmap -d example.com';
nmap -d example.com;
sleep 2s;
echo -e "\n\n";



#					"--packet-trace"
# SHOW A SUMMARY OF EVERY PACKET SENT OR RECEIVED.
# IT IS USEFUL TO KNOW WHAT EXACTLY IS NMAP SENDING.
# SPECIFY A SMALL AMOUNT OF PORTS WITH "-p" CAN HELP YOU
# TO READ IN A MORE EFFICIENT WAY.

echo '[*] Example Scan: Simple Scan with packet trace (--packet-trace)';
echo '[*] Scanning: nmap -p443 --packet-trace example.com';
nmap -p80 --packet-trace example.com;
sleep 2s;
echo -e "\n\n";



#					"-oN, -oX, -oG, -oA, -oS ... <FILENAME>"
# OUTPUT THE NMAP SCAN IN MANY FORMATS:
# NORMAL, XML, GREPABLE, (USE -oA FOR OUTPUT THIS THREE AT ONCE)
# IF YOU WANT TO HAVE A LAUGH, TRY THE SCRIPT KIDDIE "-oS"

echo '[*] Example Scan: Simple Scan with Normal File Output (-oN)';
echo '[*] Scanning: nmap -oN NMAP_NORMAL_OUTPUT.nmap example.com';
nmap -oN NMAP_NORMAL_OUTPUT.nmap example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Simple Scan with XML File Output (-oX)';
echo '[*] Scanning: nmap -oX NMAP_XML_OUTPUT.xml example.com';
nmap -oX NMAP_XML_OUTPUT.xml example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Simple Scan with Grepable File Output (-oG)';
echo '[*] Scanning: nmap -oG NMAP_GREPABLE_OUTPUT.gnmap example.com';
nmap -oG NMAP_GREPABLE_OUTPUT.gnmap example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Simple Scan with "ScRipT KIdd|3" File Output (-oG)';
echo '[*] Scanning: nmap -oS NMAP_SCRIPTKIDDIE_OUTPUT.scriptkiddie example.com';
nmap -oS NMAP_SCRIPTKIDDIE_OUTPUT.scriptkiddie example.com;
sleep 2s;
echo -e "\n\n";

#					"--append-output"
# APPEND OUTPUT, RATHER THAN OVERWRITE A FILE
# USEFUL TO APPEND MORE OUTPUT OF THE SAME SCAN/HOSTS

###########################################################

# EXAMPLE: SCAN A NETWORK FOR A DETERMINED PORT

# YOU CAN USE "-Pn" TO THREAT ALL HOSTS AS ONLINE,
# "-p" FOR THE PORT AND CIDR STYLE FOR SCAN THE NETWORK

echo '[*] Example Scan: Simple Scan for a defined port to a Network (EASY)';
echo '[*] Scanning: nmap -Pn -p80 -oG %D.gnmap 192.168.1.0/24';
echo '[*] This is a simple version but slower';
nmap -Pn -p80 -oG %D.gnmap 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Simple Scan for a defined port to a Network (IMPROVED)';
echo '[*] Scanning: nmap -T4 -Pn -p80 --min-rtt-timeout 150ms --max-rtt-timeout 200ms  --min-hostgroup 256 -oG %D_IMPROVED.gnmap 192.168.1.0/24';
echo '[*] This is a simple version but slower';
nmap -T4 -Pn -p80 --min-rtt-timeout 150ms --max-rtt-timeout 200ms  --min-hostgroup 256 -oG %D_IMPROVED.gnmap 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";

###########################################################

# EXAMPLE: EXAMPLE WITH PLAYBOY

# SHOW THE IP RANGE OF PLAYBOY.COM, SAVE THE NETRANGE AND DNS

echo '[*] Whois Scan: Playboy (WHOIS FOR DNS AND NETRANGE)';
echo '[*] Scanning: whois -h whois.arin.net n playboy';
#whois -h whois.arin.net n playboy;
whois playboy.com;
sleep 2s;
echo -e "\n\n";



# PING THE HOST TO CHECK LATENCY FOR NETRANGE SCAN TIME IN MS

echo '[*] Ping Probe: Playboy (PING FOR LATENCY)';
echo '[*] Pinging: ping -c5 www.playboy.com';
ping -c5 www.playboy.com;
sleep 2s;
echo -e "\n\n";



#USE DIG TO OBTAIN PUBLIC DNS RECORD FROM A NAMESERVER (OBTAINED WITH WHOIS)

echo '[*] Dig Scan: Playboy (DNS RECORDS)';
echo '[*] Pinging: dig @PDNS1.ULTRADNS.NET playboy.com any';
dig @PDNS1.ULTRADNS.NET playboy.com any;
sleep 2s;
echo -e "\n\n";



# YOU CAN NOW PING SOME HOSTS TOF NETRANGE DISCOVERED, YOU CAN SEND
# PACKETS TO ARBITRIARY HOSTS LIKE MX SERVERS:

echo '[*] HPING3 Probe: Playboy (SEND TCP PACKETS)';
echo '[*] Pinging: hping3 --syn -p 25 -c 5 <MAIL SERVER>';
sleep 2s;
echo -e "\n\n";