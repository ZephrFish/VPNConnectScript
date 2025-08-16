#!/bin/bash
# ZephrFish Anonine VPN Connect Script
# 2022
# 
# VPN connection script with menu selection for multiple servers
# Performs internet connectivity check and root privilege validation

# Color variable declarations for terminal output formatting
b='\033[1m'
u='\033[4m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'

# Internet connectivity check function
# Tests connection to google.com with timeout
function checkinternet() {
  if ! ping -c 1 -W 5 google.com > /dev/null 2>&1; then
    echo -e " Checking For Internet: ${r}FAILED${endc}"
    echo -e " ${y}No internet connection detected. Please check your network.${endc}"
    echo -e " ${b}Please ensure internet connectivity before running VPN script.${enda}"
    echo && sleep 2
    exit 1
  else
    echo -e " Checking For Internet: ${g}PASSED${endc}"
  fi
}

checkinternet
# Root privilege validation function
# Ensures script is run with appropriate permissions
function rootcheck() {
  if [[ $EUID -ne 0 ]]; then
    echo -e " ${r}Error: This script must be run as root or with sudo${endc}"
    echo -e " ${y}Usage: sudo $0${endc}"
    exit 1
  fi
  echo -e " Checking For Root or Sudo: ${g}PASSED${endc}"
}



# VPN server selection menu
# Displays available servers and handles user selection
rootcheck
# Configuration files should be located in /usr/vpnconf/ with proper authentication credentials
echo "######################################################"
echo "##               VPN Connect Script                 ##"
echo "######################################################"
echo ""
echo ""
echo "Please select from the following options which server you want to connect to:"
PS3='What server would you like to connect to?: '
options=("Amsterdam" "Atlanta" "Coventry" "Miami" "Moscow" "Oslo" "Paris" "Stockholm" "Sydney" "Toronto" "Zurich" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Amsterdam")
            if [[ -f "/usr/vpnconf/Amsterdam.ovpn" ]]; then
              echo -e " ${g}Connecting to Amsterdam...${endc}"
              openvpn --config /usr/vpnconf/Amsterdam.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Atlanta")
            if [[ -f "/usr/vpnconf/Atlanta.ovpn" ]]; then
              echo -e " ${g}Connecting to Atlanta...${endc}"
              openvpn --config /usr/vpnconf/Atlanta.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Coventry")
            if [[ -f "/usr/vpnconf/Coventry.ovpn" ]]; then
              echo -e " ${g}Connecting to Coventry...${endc}"
              openvpn --config /usr/vpnconf/Coventry.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Miami")
            if [[ -f "/usr/vpnconf/Miami.ovpn" ]]; then
              echo -e " ${g}Connecting to Miami...${endc}"
              openvpn --config /usr/vpnconf/Miami.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Moscow")
            if [[ -f "/usr/vpnconf/Moscow.ovpn" ]]; then
              echo -e " ${g}Connecting to Moscow...${endc}"
              openvpn --config /usr/vpnconf/Moscow.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Oslo")
            if [[ -f "/usr/vpnconf/Oslo.ovpn" ]]; then
              echo -e " ${g}Connecting to Oslo...${endc}"
              openvpn --config /usr/vpnconf/Oslo.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Paris")
            if [[ -f "/usr/vpnconf/Paris.ovpn" ]]; then
              echo -e " ${g}Connecting to Paris...${endc}"
              openvpn --config /usr/vpnconf/Paris.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Stockholm")
            if [[ -f "/usr/vpnconf/Stockholm.ovpn" ]]; then
              echo -e " ${g}Connecting to Stockholm...${endc}"
              openvpn --config /usr/vpnconf/Stockholm.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Sydney")
            if [[ -f "/usr/vpnconf/Sydney.ovpn" ]]; then
              echo -e " ${g}Connecting to Sydney...${endc}"
              openvpn --config /usr/vpnconf/Sydney.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Toronto")
            if [[ -f "/usr/vpnconf/Toronto.ovpn" ]]; then
              echo -e " ${g}Connecting to Toronto...${endc}"
              openvpn --config /usr/vpnconf/Toronto.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Zurich")
            if [[ -f "/usr/vpnconf/Zurich.ovpn" ]]; then
              echo -e " ${g}Connecting to Zurich...${endc}"
              openvpn --config /usr/vpnconf/Zurich.ovpn &
              sleep 2
              break
            else
              echo -e " ${r}Error: Configuration file not found${endc}"
            fi
            ;;
        "Quit")
            break
            ;;
        *) echo -e " ${r}Invalid option. Please try again.${endc}";;
    esac
done
