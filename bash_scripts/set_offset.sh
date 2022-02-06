# !/bin/sh

read -p "Offset: " offset

sed -i "s/<offset>/$offset/" exploit_2.py
sed -i "s/<offset>/$offset/" exploit_3.py
sed -i "s/<offset>/$offset/" exploit_4.py
