#!/bin/bash
echo -n "Enter User name list file: "
read file

while read line
  do
    sudo docker create -i -t --name $line ubuntu /bin/bash
  done < $file