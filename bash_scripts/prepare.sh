# !/bin/sh

read -p "ip: " ip
read -p "port: " port

cp /opt/bufferOverflow/exploit* .
cp /opt/bufferOverflow/pattern* .
cp /opt/bufferOverflow/fuzzer.py .
mkdir bash_scripts/
cp /opt/bufferOverflow/bash_scripts/* bash_scripts

sed -i "s/<port>/$port/" exploit_*
sed -i "s/<ip>/$ip/" exploit_*

sed -i "s/<ip>/$ip/" fuzzer.py
sed -i "s/<port>/$port/" fuzzer.py
