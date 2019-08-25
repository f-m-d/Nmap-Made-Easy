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

echo '[*] "Dig" tool: AXFR Record cpsr.org (Zone Tranfer Request';
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



##########################################################

# DNS RESOLUTION:

# BY DEFAULT, NMAP DOES A DNS-REVERSE RESOLUTION FOR
# EVERY IP ADDRESS THAT ANSWERS BACK TO DISCOVERY PROBES
# (I.E. ALL ONLINE HOSTS) WITH PARALLELIZED REQUESTS.
# NMAP OFFERS 4 OPTIONS TO CONTROL DNS RESOLUTION:

echo '[*] Example Scan: Nmap DO NOT do DNS Resolution (-n)';
echo "[*] Scanning: nmap -n example.com";
nmap -n example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Nmap DNS Resolution to all IP scanned (-R)';
echo "[*] Scanning: nmap -n example.com";
nmap -R example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Nmap use System DNS Resolution (--system-dns)';
echo "[*] Scanning: nmap --system-dns example.com";
nmap --system-dns example.com;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Nmap Use chosen DNS Servers (--dns-servers)';
echo "[*] Scanning: nmap --dns-servers <DNS_SERVER> example.com";
echo '[*] DNS file confs are: "resolv.conf" (Unix)/ Registry (Win32)';
nmap --dns-servers 192.168.1.1 example.com;
sleep 2s;
echo -e "\n\n";



##########################################################

# HOST DISCOVERY CONTROLS:

# STARTING WITH THE LESS INTRUSIVE WAY:
#
#					 "-sL"
#
# LIST THE HOSTS (WITHOUT SENDING THEM PACKETS) BUT
# STILL DOES REVERSE-DNS RESOLUTION TO LEARN THEIR NAMES.
# YOU SHOULD DO THAT TO KNOW WHAT ARE THE HOSTS OR IP
# YOU NEED TO SCAN AND WHICH YOU NEED TO AVOID.
# IN FACT, YOU CAN'T DO OS DETECTION, PORT SCANNING,
# OR PING SCANNING.

echo '[*] Example Scan: Nmap ScanList (-sL)';
echo "[*] Scanning: nmap -sL 192.168.1.0/24";
nmap -sL 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";



#					"-sn (OLD -sP)"
#
# DO ONLY PING SCAN TO CHECK WHAT HOST IS UP.
# ALSO, IT DISABLE PORT SCAN. CAN BE COMBINED
# WITH OTHER "-P*" TO HAVE MORE FLEXIBILITY.
# BY DEFAULT, SEND AN ICMP ECHO REQUEST, TCP SYN 443,
# TCP ACK 80 AND ICMP TIMESTAMP (IF EXECUTED BY PRIVILEGED),
# OTHERWISE SEND TCP SYN 443 AND 80 (IF EXECUTED BY UNPRIVILEGED).


echo '[*] Example Scan: Nmap Ping Scan (-sn)';
echo "[*] Scanning: nmap -sn 192.168.1.0/24";
nmap -sn 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";



#					"-Pn (OLD PN)"
# SKIP THE DISCOVERY STAGE ALTOGETHER.
# USUALLY, NMAP DOES PORT SCANS, VERSION DETECTION,
# OD DETECTION AGAINST HOSTS FOUND TO BE UP.
# WITH THIS OPTION, INSTEAD, NMAP TRY TO SCAN
# EVERY IP ADDRESS SPECIFIED.
# IT IS USEFUL BECAUSE SOME MACHINES CAN BE FIREWALLED AND
# CAN'T ANSWER TO PING PROBES.
# ANOTHER GOOD REASON IS THAT THEY ARE ALREADY KNOWKN
# THE MACHINES IP AND SO THERE IS NO REASON TO SCAN
# FOR OTHER HOSTS.

echo '[*] Example Scan: Disable Ping Scan (-sn)';
echo "[*] Scanning: nmap -Pn 192.168.1.0/24";
nmap -Pn 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";



##########################################################

# HOST DISCOVERY TECHNIQUES:

# TODAY, NOT ALL HOSTS PROVIDE A RESPONSE TO ICMP ECHO.
# TO BE SURE IF THE HOST ACTIVITY IS UP, YOU CAN SPECIFY
# A LOT OF OTHER TECHINIQUES TO DO A HOST DISCOVERY.

echo '[*] Example Scan: Ping Scan but not all target answer BACK(-sn)';
echo "[*] Scanning: nmap -sn -PE -R -v microsoft.com ebay.com citibank.com google.com slashdot.org yahoo.com";
nmap -sn -PE -R microsoft.com ebay.com citibank.com google.com slashdot.org yahoo.com;
sleep 2s;
echo -e "\n\n";



#					"-PS<PORT-LIST>"
# SENDS AN EMPTY TCP PACKET WITH THE "SYN" FLAG SET.
# IT SUGGETS TO THE ATTACKED HOST THAT YOU ARE
# ATTEMPTING TO ESTABILISH A CONNECTION (SYN,SYN+ACK,ACK).
# IF THE PORT IS CLOSED YOU WILL HAVE RESET PACKET (RST),
# IF IT OPEN YOU WILL HAVE AN ACK.
# IF THE PORT IS OPEN, NMAP RESPOND WITH AND (RST)
# PACKAGE TO BLOCK THE 3-WAY HANDSHAKE: IF THE HOST
# ANSWER WITH AN RST OR ACK, IT MEANS THAT IT IS ON.
# USING CORRECTLY -PS ARG HELP TO BYPASS FIREWALLS CONTROL

echo '[*] Example Scan: Ping Scan on TCP SYN on PORT 80';
echo "[*] Scanning: nmap -sn -PE -R -v microsoft.com ebay.com citibank.com google.com slashdot.org yahoo.com";
nmap -sn -PS80 -R microsoft.com ebay.com citibank.com google.com slashdot.org yahoo.com;
sleep 2s;
echo -e "\n\n";
echo "[*] As you see, all the hosts now are up!!!";
sleep 2s;
echo -e "\n\n";



#					"-PA<PORT-LIST>"
# SENDS AN EMPTY TCP PACKET WITH THE "ACK" FLAG SET.
# AN "ACK" PACKET SENT THIS WAY LET THE HOST ANSWER
# BACK WITH AN (RST) PACKET: BECAUSE THE CONNECTION
# ON THAT PORT DOESN'T EXIST.
# USING CORRECTLY -PA ARG HELP TO BYPASS FIREWALLS CONTROL

echo '[*] Example Scan: Ping Scan TCP ACK on PORT 80';
echo "[*] Scanning: nmap -sn -PA80 microsoft.com";
nmap -sn -PA80 microsoft.com;
sleep 2s;
echo -e "\n\n";
echo "[*] The firewall blocks the ACK, showing us the host as down!!!";
sleep 2s;
echo -e "\n\n";



#					"-PU<PORT-LIST>"
# CALLED "UDP PING", IT SEND AN EMPTY UDP PACKET
# (UNLESS --data-length IS SPECIFIED) TO 40125,
# UNLESS OTHER PORTS ARE SPECIFIED.
# IF THE UDP PACKET IS SENT TO A CLOSEN PORT,
# THE UDP PROBE SHOULD ELICIT AN "ICMP PORT UNREACHABLE"
# PACKET IN RETURN: THAT MEANS THE HOST IS UP.
# IF THE UDP PACKET IS SENT TO AN OPEN PORT, IT
# WILL GIVE BACK NO RESPONSE.
# THE ADVANTAGE IS TO BYPASS ALL THE FIREWALLS SCREENING
# TCP-ONLY PACKETS.

echo '[*] Example Scan: Ping Scan UP on default port (40125)';
echo "[*] Scanning: nmap -sn -PU microsoft.com";
nmap -sn -PU microsoft.com;
sleep 2s;
echo -e "\n\n";
echo "[*] The firewall blocks the UDP, showing us the host as down!!!";
sleep 2s;
echo -e "\n\n";



#					"-PE, -PP, -PM"
# WITH -PE OPTION, NMAP CAN SEND STANDARD PACKETS
# LIKE THE "PING" PROGRAM DOES.
# MOST OF HOSTS WILL NOT ANSWER TO THAT PING RESPONSE,
# BUT CAN BE PRATICAL TO SYSADMINS MONITORING THEIR NETWORK.
#
# "-PE" 		ICMP ECHO REQUEST (ICMP TYPE 8)
# "-PP"			ICMP TIMESTAMP REQUEST (ICMP CODE 14)
# "-PM"			ICMP ADDRESS MASK REQUEST (ICMP CODE 18)
#
# THEY ARE USED TO HOST DISCOVERY
# (NMAP DOESN'T IMPLEMENT THIS INFORMATION REQUESTED PACKETS,
# THEY ARE NOT SUPPORTED WIDELY)		
# IT IS USEFUL IF THE FIREWALL/ADMIN BLOCK ICMP PING (TYPE 8)
# BUT FORGOT TO MANAGE/BLOCK OTHER ICMP QUERIES.

echo '[*] Example Scan: ICMP Queries (Echo, Timestamp, Address Mask)';
echo "[*] Scanning (Echo): nmap -sn -PE microsoft.com";
nmap -sn -PU microsoft.com;
echo -e "\n\n";
echo "[*] Scanning (Timestamp): nmap -sn -PP microsoft.com";
nmap -sn -PU microsoft.com;
echo -e "\n\n";
echo "[*] Scanning (Address Mask): nmap -sn -PM microsoft.com";
nmap -sn -PU microsoft.com;
sleep 2s;
echo -e "\n\n";



#					"-PO<PROTOCOL-LIST>"
# IP PROTOCOL PING, WITH A SPECIFIED PROTOCOL SET IN
# IP PACKET HEADER. BY DEFAULT IT SENDS MULTIPLE PACKETS:
# ICMP (PROTOCOL 1), IGMP (PROTOCOL 2), IP-IN-IP (PROTOCOL 4)
# FOR TCP (PROTOCOL 6), UDP (PROTOCOL 17) AND THE OTHER PACKETS
# MENTIONED ABOVE, PACKET WILL BE SEND WITH A PROPER HEADER.
# OTHER PACKAGES WITH DIFFERENT PROTOCOLS HAVE NO ADDITIONAL
# DATA (UNLESS --data-string, --data OR --data-length ARE SPECIFIED)
# THIS METHOD WORK THE SAME WAY AS ICMP PROTOCOLS WORK

echo '[*] Example Scan: IP Ping (-PO)';
echo "[*] Scanning: nmap -sn -PO example.com";
nmap -sn -PO example.com;
sleep 2s;
echo -e "\n\n";



#					"-PR"
# DOES AN ARP SCAN TO THE LOCAL ETHERNET NETWORK:
# IT IS STRONGER AND FASTER THAN OTHER PING ARGUMENTS
# SO NMAP WILL DO AN ARP SCAN INSTED OF OTHER -P*,
# EVEN ICMP PACKETS.
# THE DIFFERENCE BETWEEN IP AND ARP IS SHOWN:
#
# --send-eth		SEND RAW ETHERNET FRAMES
# --send-ip			SEND RAW IP PACKETS
# --packet-trace	SHOW ALL PACKET SENT AND RECEIVED

echo '[*] Example Scan: IP Packet sent (--send-ip)';
echo "[*] Scanning: nmap -n -sn --send-ip --packet-trace 192.168.1.1/24";
nmap -n -sn --send-ip --packet-trace 192.168.1.1/24;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: ARP Packet sent (-PR)';
echo "[*] Scanning: nmap -n -sn -PR --send-eth 192.168.1.1/24";
nmap -n -sn -PR --send-eth 192.168.1.1/24;
echo -e "\n\n";
echo "[*] Both -PR and --send-eth ARE NULLIFIED!!!";
echo "[*] Because ARP scan is default for hosts on local network";
sleep 2s;
echo -e "\n\n";



##########################################################

# CHOOSING/COMBINING PING OPTIONS:

