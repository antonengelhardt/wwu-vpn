#!bin/bash

# This script is used to connect to the WWU VPN. It is meant to be used with a
# keyboard shortcut. Change the Constants before running the script.

USER=<put-your-wwu-id-here>
PASSWORD=<put-your-wlan-netzzugangspasswort-here>
OTP_CODE=$(oathtool --totp <put-your-base-16-keimwert-here-get-it-from-wwu-it-portal>
VPN_HOST=vpn.uni-muenster.de
# use openconnect to connect to the VPN
if pgrep openconnect > /dev/null
then
    echo "Disconnecting from VPN..."
    sudo killall openconnect
else
    echo "Connecting to VPN..."
    { echo ${USER}; echo ${PASSWORD}; echo ${OTP_CODE}; } | sudo openconnect -b -q ${VPN_HOST}
fi
