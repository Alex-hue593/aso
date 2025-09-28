#!/bin/bash

valor=1
until [[ $valor -eq 0 ]]; do

read -p "Elija un numero: " valor

suma=$((suma+valor))
echo "$suma"
done

echo "Resultado final = $suma"
