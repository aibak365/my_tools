#!/bin/bash
host $1 |grep "has add"
echo "ips__________________________________________________________"
host -t ns $1
echo "ns_record____________________________________________________"
host -t mx $1
echo "mx_record_____________________________________________________"
a=$(host -t ns $1|cut -d " " -f 4)
for ns in $a;
do
host -l $1 $ns |grep -v "not" 
#echo $ip
#echo "\nzonetransfere_for_ns---------------------------------------------------------------------"
done
echo "---------------------------------------------------------------------"
echo "subdoanins brute forces"
ss=$(cat subdomains-top1million-110000.txt)
for i in $ss;
do 
host $i.$1|grep "has add"
s1=$(echo $1 |cut -d "." -f 1)
s2=$(echo $1 |cut -d "." -f 2)
host $s1.$i.$2| grep  "has add"
done 
