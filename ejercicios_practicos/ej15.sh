#!/bin/bash


read -p "Elija un número: " num
for (( i=1; i<=10;  i++ )); do 
res=$((num * i))
echo "$i x $num = $res"
done
