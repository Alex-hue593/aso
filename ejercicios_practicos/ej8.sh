#!/bin/bash

read -p "Numero 1: " n1
read -p "Numero 2: " n2

if [[ $n1  -gt $n2 ]];  then 
	echo "$n1 es mayor"
else
	echo "$n2 es mayor"
fi

