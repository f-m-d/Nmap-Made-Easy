#!/bin/bash

# YOU CAN SPECIFY TARGETS IN THE CIDR STYLE:
# IT MEANS THAT THE FIRST "N" BITS ARE FIXED AND
# NMAP WILL TRY FOR ALL THE COMBINATION OF THE
# UNSETTED BITS
#
# E.G.: 192.168.1.0/0
# IT MEANS "START FROM 0.0.0.0 TO 255.255.255.255"
#
# E.G.: 192.168.1.0/8
# IT MEANS "START FROM 192.0.0.0 TO 192.255.255.255"
#
# E.G.: 192.168.1.0/16
# IT MEANS "START FROM 192.168.0.0 TO 192.168.255.255"
#
# E.G.: 192.168.1.0/24
# IT MEANS "START FROM 192.168.1.0 TO 192.168.1.255"
#
# E.G.: 192.168.1.1/32
# IT MEANS "START AND FINISH ON 192.168.1.1"
#
#
#
# YOU CAN ALSO SPECIFY SEPARATED VALUES OR A RANGE:
# USE A COMMA TO SEPARATE NUMBERS,
# USE A HYPHEN TO SET A RANGE OF NUMBERS.
#
# E.G:
# 192.168.1.1,7			SCAN 192.168.1.1 AND 192.168.1.7
# 192.168.1.1-10		SCAN FROM 192.168.1.1 TO 192.168.1.10
# 192.168.1-3,6.1,2-4	USE BOTH NOTATION

# EXAMPLE SCAN
echo "[*] Example Scan: Using CIDR, Comma and Hyphen notation.";
echo "[*] Scanning: nmap 127.0.0.1/30";
echo ""
nmap 127.0.0.1/30;
echo "[*] Scan completed <3";
sleep 3s;



# YOU CAN GIVE A LIST OF IP ADDRESS/DOMAIN TO SCAN WITH
# THE "-iL" ARGUMENT: ELEMENTS CAN BE DIVEDED USING
# SPACES, TABS AND NEWLINES.
# YOU CAN SEE SOME EXAMPLES LIKE "HOSTS_IL1/2/3.TXT" FILES

echo '[*] Example Scan: Input from a list with "-iL"';
echo "[*] Scanning: nmap -iL Hosts_iL1.txt";
touch Hosts_iL1.txt 2> /dev/null;
echo "scanme.nmap.org 127.0.0.1 192.168.1.1" > Hosts_iL1.txt; 
echo ""
nmap -iL Hosts_iL1.txt 2> /dev/null;
echo "[*] Scan completed (again) <3";
sleep 3s;



# FOR SURVEYS OR OTHER KIND OF RANDOMIZED RESEARCH,
# YOU CAN USE THE "-iR <NUM_TARGET>" ARGUMENT:
# CHOOSE A RANDOM NUMBER OF IP ADDRESS TO TARGET.
# THE 0 ARGUMENT MEANS "NEVER ENDING SCAN"

echo '[*] Example Scan: Randomized Scan "-iR"';
echo "[*] Scanning: nmap -iR 2";
echo "";
nmap -v -iR;
echo ""
echo "[*] Curiosity: You can try: nmap -sS -PS80 -iR 0 -p 80";
echo "[*] It will scan for random web servers (CARE FOR LEGAL ISSUES)";
echo "[*] Scan completed (another one) <3";
sleep 3s;



# TO EXCLUDE SOME IP ADDRESSES, DOMAINS OR COMPUTER
# (TO AVOID LEGAL ISSUES OR TO SAVE TIME AND FOCUS)
# YOU CAN USE THE "--exclude" ARGUMENT TO EXCLUDE
# THE IP ADDRESSES/DOMAIN/MACHINES YOU WANT TO.
# (COMMA SEPARATED) OR USE THE "--excludefile" OPTION.
# "--excludefile" FOLLOW THE SAME WRITING RULES AS "-iL"

echo '[*] Example Scan: Excluding Targets with "--exclude" & "--excludefile"';
echo "[*] Scanning: nmap 127.0.0.1/30 --exclude 127.0.0.3";
echo "";
nmap 127.0.0.1/30 --exclude 127.0.0.3;
echo "";
sleep 5;
echo "[*] Scanning: nmap 127.0.0.1/29 --excludefile Hosts_excludefile.txt";
echo "";
touch Hosts_excludefile.txt 2> /dev/null;
echo "127.0.0.2 127.0.0.4 127.0.0.6" > Hosts_excludefile.txt;
nmap 127.0.0.1/29 --excludefile Hosts_excludefile.txt;
echo "[*] Scan completed (YES) <3";
sleep 3s;



###########################################################



# TO GET STARTED WITH A REAL SCAN, WE NEED TO GROUP
# THE IP ADDRESSES AND THE DOMAINS WHICH WE ARE ALLOWED
# TO SCAN. WE CAN GET STARTED USING THE "host" TOOL.
#
# PS: CHANGE THE EXAMPLE.COM SITE AND BE CAREFUL ABOUT
# LEGAL ISSUE

echo '[*] "Host" commands examples:'
echo -e "\n\n";

echo '[*] NS Record (Actual DNS that answer you requests)';
host -t ns example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] A Record (Link the domain name with IP4 Addresses)';
host -t a example.com
sleep 2s;
echo -e "\n\n";

echo '[*] AAAA Record (Link the domain name with IP6 Addresses)';
host -t aaaa example.com
sleep 2s;
echo -e "\n\n";

echo '[*] MX Record (Actual DNS that manage the domain emails)';
host -t mx example.com
sleep 2s;
echo -e "\n\n";

# MORE INFO AT:
# https://kb.cloud.it/domain-center/servizio-dns/record-soa.aspx
echo '[*] SOA Record ("Start of Authority", give authoritative info)';
host -t soa example.com
sleep 2s;
echo -e "\n\n";

echo '[*] TXT Record (Descriptive info about the domain or domain host)';
host -t txt example.com
sleep 2s;
echo -e "\n\n";

echo '[*] CNAME Record (Show aliases (A/AAAA/CNAME) of the selected domain)';
host -t cname example.com
sleep 2s;
echo -e "\n\n";

# AFTER YOU HAVE DONE THIS COMMANDS, YOU CAN OBTAIN
# THE IP ADDRESSES OF THE NS TARGETS DOING
# A RECURSIVE HOST COMMAND ON RESULTS OR TRYING
# FOR AN ENUMERATION OF SUBDOMAINS OR YOU CAN
# USE "WEBSPLOIT" WITH WEB/ MODULES (IF THEY USE A CLOUD)
# OR YOU CAN USE SUBBRUTEPY (CARE, AGAI, ABOUT LEGAL DISCLAIMERS)

# YOU CAN REQUIRE A ZONE TRANSFER USINH DIG COMMAND AND
# SPECIFYING A DNS AS AN ARGUMENT

echo '[*] "Dig" tool: AXFR Record (Zone Tranfer Request';
dig @INSERT_DNS_OF_CPSR -t AXFR cpsr.org
sleep 2s;
echo -e "\n\n";



# PINGING A DOMAIN DOESN'T MEAN THAT THE HOST CAN BE PART
# OF THE NET WE NEED TO SCAN. YOU CAN GET BETTER INFO
# WITH DNS REVERSE RESOLUTION, TRACEROUTE AND WHOIS VERSUS
# THE IP ADDRESS OBTAINED

# EXAMPLES
echo '[*] Example Scan: Traceroute with nmap and ICMP Echo request discovery probes';
echo "[*] Scanning: nmap -PE -T4 --traceroute example.com";
nmap -PE -T4 --traceroute example.com
sleep 2s;
echo -e "\n\n";



# YOU CAN GET MORE INFO USING WHOIS COMMAND:
# IMPORTANT LINES ARE ABOUT ORGANIZATION (ORGNAME)
# YOU CAN USE EXTERNAL SERVICES TO GET THE NETBLOCK:
# https://searchdns.netcraft.com/

# EXAMPLES
echo '[*] "Whois" tool: asking for example.com IP Info';
echo '[*] Scanning: whois example.com / whois151.101.194.187';
whois 151.101.194.187;
sleep 2s;
echo -e "\n\n";

echo '[*] "Whois" tool: Query example.com';
echo '[*] Scanning: whois -h whois.arin.net @example.com';
whois -h whois.arin.net @example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] "Whois" tool: Query Netblock of example';
echo '[*] Scanning: whois -h whois.arin.net "n example*"';
whois -h whois.arin.net "n example*";
sleep 2s;
echo -e "\n\n";

echo '[*] "Whois" tool: Query Organization starting with example';
echo '[*] Scanning: whois -h whois.arin.net "o example*"';
whois -h whois.arin.net "o example*";
sleep 2s;
echo -e "\n\n";



# ENTITIES (E.G.: MICROSOFT) ARE ASSIGNED WITH
# AUTONOMOUS SYSTEM NUMBER (AS) FOR A GIVEN IP ADDRESS.
# AN USEFUL LINK TO DETERMINE THE "AS" USING AN IP ADDRESS:
# http://asn.cymru.com/
# ALSO, YOU CAN TIPE "AS<NUMBER> (E.G.: AS8075)"
# AT THE FOLLOWING SITE SEARCH BAR TO FIND ALL THE
# IP PREFIXES WHICH ROUTE TO THIS "AS":
# https://www.robtex.com/as/
# https://www.robtex.com/as/AS8075.html