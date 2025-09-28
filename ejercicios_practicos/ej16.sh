#!/bin/bash

echo "for"
for (( i_1=1; i_1<=1000; i_1++)); do
echo "$i_1"
done

echo "while"
i_2=1
while [[ $i_2 -le 1000 ]]; do
	echo $i_2
	((i_2++))
done

echo "until"
i_3=1
until [ $i_3 -gt 1000 ]; do
	echo "$i_3"
	((i_3++))
done
