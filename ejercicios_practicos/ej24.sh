#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

DIRECTORIO="$1"


if [ ! -e "$DIRECTORIO" ]; then
    echo "Error: El directorio no existe."
    exit 1
fi

if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: no es un directorio."
    exit 1
fi

NUM_FICHEROS=$(find "$DIRECTORIO" -maxdepth 1 -type f | wc -l)
NUM_SUBDIRS=$(find "$DIRECTORIO" -maxdepth 1 -type d | wc -l)
NUM_SUBDIRS=$((NUM_SUBDIRS - 1))

echo "El directorio '$DIRECTORIO' contiene:"
echo "  Ficheros: $NUM_FICHEROS"
echo "  Subdirectorios: $NUM_SUBDIRS"
