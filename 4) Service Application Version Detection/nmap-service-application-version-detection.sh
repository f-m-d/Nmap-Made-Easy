#!/bin/bash

#####################################################################################

# PORT AND VERSION

# WITH THE "nmap-services" NMAP CAN TRY TO GUESS WHAT IS ON THE PORT SCANNED
# COMMON GUESSES LIKE 80/HTTP AND 443/HTTPS OCCURS BUT REMEMBER:
# SOME PEOPLE CAN RUN COMMON SERVICES ON UNCOMMON PORTS
#
# FOR VULNERABILITY ASSESSMENTS, YOU WANT TO KNOW THE APPLICATION AND HIS VERSION:
# IT HELPS TO DETERMINATE WHICH EXPLOIT YOU CAN USE
#
# A GOOD REASON TO DETERMINATE THE SERVICE TYPE IS THAT MANY SERVICES
# CAN SHARE THE SAME PORT NUMBER: 
#
# A VERSION SCAN CAN PROVIDE THE SERVICE NAME, THE VERSION AND
# ADDITIONAL INFO ABOUT IT (WRITTEN IN PARENTHESIS)

echo '[*] Example Scan: Scan Version';
echo '[*] Scanning: nmap -sV -F -T4 insecure.org';
nmap -sV -F -T4 insecure.org;
sleep 2s;
echo -e "\n\n";



#####################################################################################

# PROBE SELECTION AND RARITY

# NMAP SERVICE PROBES ARE ASSOCIATED WITH A RARITY: THIS DIFFERENCIATE
# FROM COMMON PROBES TO RARE PROBES.
# SHOWING SOME USEFUL ARGS:
#
# --version-intensity[0..9]					FROM 0 (NULL PROBE FOR TCP). DEFAULT VALUE IS 2.
#											HIGHER THE VALUE, HIGHER THE NUMBER OF PROBES.
# --version-all								IS EQUAL TO "--version-intensity 9".
# --version-trace							SHOW WHAT VERSION SCANNING IS DOING.

######################################################################################