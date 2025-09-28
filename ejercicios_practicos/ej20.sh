#!/bin/bash

read -p "Elija un número: " numero1
resto=1
numero2=2

until [[ $resto -eq 0 ]]; do
resto=$((numero1 % numero2))
((numero2++))
done

if [[ $numero1 -eq $((numero2-1)) ]]; then
echo "es primo"
else
echo "No es primo"
fi



