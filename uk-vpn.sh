#!/bin/bash
openvpn --config /usr/vpnconf/London.ovpn 
sleep 2
geoiplookup $(curl ipinfo.io/ip --silent)
