#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1

if [[ ! -d $directorio ]]; then
    echo "Error: $directorio no es un directorio válido"
    exit 1
fi

contador=0

for entrada in "$directorio"/*; do
    if [[ -d $entrada ]]; then
        echo "$(basename "$entrada") → directorio"
    elif [[ -f $entrada ]]; then
        echo "$(basename "$entrada") → fichero"
    else
        echo "$(basename "$entrada") → otro tipo"
    fi
    ((contador++))
done

echo "Total de entradas procesadas: $contador"
