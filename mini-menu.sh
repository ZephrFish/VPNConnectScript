#!/bin/bash
# Mini VPN Connect Script
# ZephrFish 2022
# Simplified VPN connection menu with limited server options

echo "######################################################"
echo "##               VPN Connect Script                 ##"
echo "######################################################"
echo ""
echo ""
echo "Please select from the following options which server you want to connect to:"
PS3='What server would you like to connect to?: '
options=("Amsterdam" "London" "Miami" "Moscow" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Amsterdam")
            if [[ -f "/usr/vpnconf/Amsterdam.ovpn" ]]; then
                echo "Connecting to Amsterdam..."
                openvpn --config /usr/vpnconf/Amsterdam.ovpn &
                sleep 2
                break
            else
                echo "Error: Configuration file not found"
            fi
            ;;
        "London")
            if [[ -f "/usr/vpnconf/London.ovpn" ]]; then
                echo "Connecting to London..."
                openvpn --config /usr/vpnconf/London.ovpn &
                sleep 2
                break
            else
                echo "Error: Configuration file not found"
            fi
            ;;
        "Miami")
            if [[ -f "/usr/vpnconf/Miami.ovpn" ]]; then
                echo "Connecting to Miami..."
                openvpn --config /usr/vpnconf/Miami.ovpn &
                sleep 2
                break
            else
                echo "Error: Configuration file not found"
            fi
            ;;
        "Moscow")
            if [[ -f "/usr/vpnconf/Moscow.ovpn" ]]; then
                echo "Connecting to Moscow..."
                openvpn --config /usr/vpnconf/Moscow.ovpn &
                sleep 2
                break
            else
                echo "Error: Configuration file not found"
            fi
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option. Please try again.";;
    esac
done
