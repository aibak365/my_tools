#!/bin/bash
subnet=$(echo $1 |cut -d "/" -f 2)
bb=$(echo $1 |cut -d "/" -f 1)
a=$(echo $bb |cut -d "." -f 1)
b=$(echo $bb |cut -d "." -f 2)
c=$(echo $bb |cut -d "." -f 3)
d=$(echo $bb |cut -d "." -f 4)
ips=$((32-$subnet))
ips=$((2**$ips))
ips=$(($ips-1))
while [ $ips -gt 0 ]
do
  ping -c 1 $a.$b.$c.$d
  d=$(($d+1))
  if [ $d -eq 255 ];
    then 
	d=1
	c=$(($c+1))
  fi
  if [ $c -eq 255 ];
  then
	  c=1
	  d=1
	  b=$(($b+1))
  fi
  if [ $b -eq 255 ];
  then
	  b=1
	  c=1
	  d=1
	  a=$(($a+1))
  fi
  if [ $a -eq 255 ];
	 then
		 break
  fi

  ips=$(($ips-1))





done
echo "we fininsh ping in all thess ips"
echo "bye"
