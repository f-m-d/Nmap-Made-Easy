#!/bin/bash

#####################################################################################

# PORT AND VERSION

# OS DETECTION IS IMPORTANT TO DETECTION FOR SOME REASON:
# DETERMING VULNERABILITY, EXPLOIT, SOFTWARE OS-ONLY ETC.
# IT IS AN INTRUSIVE INFORMATION, SO BE CAREFUL
# NMAP TAKESA SUBJECT FINGERPRINT AND TEST WITH "nmap-os-db" FILE

echo '[*] Example Scan: OS Detection (-O)';
echo '[*] Scanning: nmap -O -v scanme.nmap.org';
nmap -O -v scanme.nmap.org;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: OS Detection (-O --osscan-limit)';
echo '[*] Scanning: nmap -O --osscan-limit -v scanme.nmap.org';
echo '[*] Only try OS Detection if there is an Open and a Closed TCP Port!';
nmap -O --osscan-limit -v scanme.nmap.org;
sleep 2s;
echo -e "\n\n";

echo '[*] Example Scan: OS Detection (-O --osscan-guess)';
echo '[*] Scanning: nmap -O --osscan-guess -v scanme.nmap.org';
echo '[*] Try to guess as a PERCENTAGE the host that match some criteria.';
nmap -O --osscan-guess -v scanme.nmap.org;
sleep 2s;
echo -e "\n\n";



# IF "-O" OPTION DOESN'T GIVE A RESPONSE, YOU CAN TRY
# WITH "-sV" TO OBTAIN MORE INFO:
# SOME APPLICATION/VERSION SHARE THE OS TYPE AND VERSION

echo '[*] Example Scan: OS Detection (-O, -sV)';
echo '[*] Scanning: nmap -O -sV -v scanme.nmap.org';
nmap -O -sV -v scanme.nmap.org;
sleep 2s;
echo -e "\n\n";