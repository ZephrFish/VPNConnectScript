#!/bin/bash
# UK VPN Connection Script
# Connects to London VPN server and verifies location

# Check if config file exists
if [[ ! -f "/usr/vpnconf/London.ovpn" ]]; then
    echo "Error: London VPN configuration file not found at /usr/vpnconf/London.ovpn"
    exit 1
fi

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be run as root or with sudo"
    echo "Usage: sudo $0"
    exit 1
fi

echo "Connecting to London VPN server..."
openvpn --config /usr/vpnconf/London.ovpn &
sleep 3

# Verify connection and location
echo "Verifying connection and location..."
if command -v geoiplookup &> /dev/null; then
    PUBLIC_IP=$(curl -s --connect-timeout 10 ipinfo.io/ip)
    if [[ -n "$PUBLIC_IP" ]]; then
        geoiplookup "$PUBLIC_IP"
    else
        echo "Warning: Could not retrieve public IP address"
    fi
else
    echo "Warning: geoiplookup command not found. Install geoip-bin package."
fi
