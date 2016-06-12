#!/bin/bash
# Updated VPN Script
# ZephrFish

echo "######################################################"
echo "##               VPN Connect Script                 ##"
echo "######################################################"
echo ""
echo ""
echo "Please Select from the Following optinos what server you want to connect to"
PS3='What server would you like to connect to?: '
options=("Amsterdam" "London" "Miami" "Moscow" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Amsterdam")
		openvpn --config /usr/vpnconf/Amsterdam.ovpn & 
		;;
	"London")
		openvpn --config /usr/vpnconf/London.ovpn & 
		break		
		;;
	"Miami")
		openvpn --config /usr/vpnconf/Miami.ovpn &
		;;
	"Moscow")
		openvpn --config /usr/vpnconf/Moscow.ovpn &
		;;
	"Quit")
		break
	   	;;
        *) echo "invalid option, please try again";;
    esac
done
