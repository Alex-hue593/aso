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
        tipo="directorio"
    elif [[ -f $entrada ]]; then
        tipo="fichero"
    elif [[ -L $entrada ]]; then
        tipo="enlace simbólico"
    elif [[ -b $entrada ]]; then
        tipo="archivo especial de bloque"
    elif [[ -c $entrada ]]; then
        tipo="archivo especial de carácter"
    else
        tipo="otro tipo"
    fi

    echo "$(basename "$entrada") → $tipo"
    ((contador++))
done

echo "Total de entradas procesadas: $contador"
