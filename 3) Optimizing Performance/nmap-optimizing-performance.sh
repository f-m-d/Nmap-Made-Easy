#!/bin/bash

#####################################################################################

# SCAN TIME REDUCTION TECHNIQUES

# IF YOU NEED TO KNOW IF HOSTS ARE ONLINE, JUST USE "-sn" ON THE NET:
# YOU WILL WASTE A LOT LESS TIME: "-sn" DISABLE PORT SCAN AND ONLY PING

echo '[*] Example Scan: Determine if hosts are online';
echo '[*] Scanning: nmap -sn -n 192.168.1.0/24';
echo '[*] The "-sn" argument will only do a ping scan and disable port scan';
nmap -sn -n 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";



# LIMIT THE NUMBER OF PORTS SCANNED:
# YOU CAN USE THE "-p" ARG FOR SCAN A DEFINED NUMBER OF PORTS,
# OR USE THE "-F" OPTION TO SCAN THE MOST COMMON ONLY

echo '[*] Example Scan: Scanning a range of ports only (-p)';
echo '[*] Scanning: nmap -p-1023 192.168.1.0/24';
echo '[*] The "-p" reduce the number of port scanned';
nmap -p-1023 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: Scanning the common ports only (-F)';
echo '[*] Scanning: nmap -F 192.168.1.0/24';
echo '[*] The "-F" scan ports named in "nmap-services" file!! ';
nmap -F 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";



# CARE ABOUT "-A" OPTION: IT ENABLES
# OS DETECTION (-O), VERSION SCANNING (-sV), SCRIPT SCANNING (-sC) AND TRACEROUTE (--traceroute).
# IF NOT NEEDED, JUST ADD THE OPTION THAT YOU REALLY NEED (E.G. ONLY OS AND NOT SCRIPTING ETC.)

echo '[*] Example Scan: Aggressive Scan separated options (-O,-sV,-sC,--traceroute)';
echo '[*] Scanning: nmap -O -sV -sC --traceroute 192.168.1.0/24';
echo '[*] If you use "-A" option, is like using "-O,-sV,-sC,--traceroute" all in one!';
nmap -O -sV -sC --traceroute 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";



# AVOID DNS RESOLUTION IF NOT NEEDED:
# USE THE "-n" OPTION TO AVOID DNS RESOLUTION

echo '[*] Example Scan: Scan without DNS-resolution (-n)';
echo '[*] Scanning: nmap -n 192.168.1.0/24';
echo '[*] If you do nott need DNS resolution, just avoid it with "-n" !!!';
nmap -n 192.168.1.0/24;
sleep 2s;
echo -e "\n\n";



#####################################################################################

# OPTIMIZE UDP SCANS

# TRY TO SCAN TCP & UDP IN ONE NMAP SCAN (E.G. -sSU / -sAU)
# BECAUSE UDP SCAN IS MUCH SLOWER THAN TCP SCAN.
# YOU CAN SPEED UP UDP SCANS WITH THE FOLLOWING FLAGS:
#
# INCREASE PARALLELISM:				--min-hostgroup LARGE_NUMBER (E.G. 100)
# SCAN POPULAR PORTS FIRST:			-F / -p
# ADD VERSION GUESSING SIMPLE		--version-intensity 0 (uses "nmap-services-probes")
# SEPARATE TCP SCAN FROM UDP
# SCAN BEHIND THE FIREWALL FOR TCP AND NOT ACROSS (THIS AVOID CONGESTION)
# SKIP LOW HOSTS 					--host-timeout
# USE VERBOS TO KNOW TIME SCAN FOR SINGLE HOSTS

echo '[*] Example Scan: Optimizied UDP Scan';
echo '[*] Scanning: nmap -T4 -sUV -F --version-intensity 0 scanme.nmap.org';
echo '[*] If you do nott need DNS resolution, just avoid it with "-n" !!!';
nmap -T4 -sUV -F --version-intensity 0 scanme.nmap.org
sleep 2s;
echo -e "\n\n";