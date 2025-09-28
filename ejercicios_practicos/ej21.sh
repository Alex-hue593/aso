#!/bin/bash

objetivo=42
intento=-1


while [[ $intento -ne 0 && $intento -ne $objetivo ]]
do
    read -p "Elige un número: " intento

        if [[ $intento -lt $objetivo ]]; then
            echo "El número es mayor que $intento."
        else
            echo "El número es menor que $intento."
        fi
done


if [[ $intento -eq $objetivo ]]; then
    echo "Enhorabuena, has acertado."

fi
