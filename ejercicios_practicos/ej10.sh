#!/bin/bash

read -p "Numero: " num

rest=$((num % 2))

if [[ $rest -eq 0 ]]; then 
	echo "$num Es par "
else
	echo "$num Es impar"
fi


