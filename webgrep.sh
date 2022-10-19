#!/bin/bash
# Check if more than 1 arg supplied
if [ $# -gt 1 ]; then
        echo "Usage: sudo ./webgrep.sh <Line Separated nmap.gnmap>"
        echo "Example: sudo ./webgrep.sh nmap.gnmap"
        exit 1
fi
# Check if no args supplied
if [ $# -eq 0 ]; then
        echo "Usage: sudo ./webgrep.sh <Line Separated nmap.gnmap>"
        echo "Example: sudo ./webgrep.sh nmap.gnmap"
        exit 1
fi
for i in {4..20}
    do
        cat $1 |grep open| cut -d " " -f 2,$i|grep open|cut -d "/" -f 1 >> tmp.txt
    done
cat tmp.txt|sed "s/\s/:/g">tmp2.txt
for i in `cat tmp2.txt`
    do
        if echo $i |grep -q -e 443 -e 8443 -e 9443
        then
        echo "https://"$i
        else
        echo "http://"$i
        fi
    done
rm tmp*