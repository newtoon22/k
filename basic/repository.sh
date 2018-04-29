#!/bin/bash
# Typical error [E: Unable to locate package

cd /etc/apt/
rm -f sources.list
sudo echo "# New Repository

deb http://http.kali.org/kali kali-rolling main contrib non-free 
deb-src http://http.kali.org/kali kali-rolling main contrib non-free

# Kali Sana - Old Repository
deb http://old.kali.org/kali sana main non-free contrib
deb-src http://old.kali.org/kali sana main non-free contrib

# Kali Moto - Old Repository
deb http://old.kali.org/kali moto main non-free contrib
deb-src http://old.kali.org/kali moto main non-free contrib" > sources.list
exit
