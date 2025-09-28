#!/bin/bash

TARGET="${1:-.}"
OUTPUT="archivos_peligrosos.txt"

if [ ! -e "$TARGET" ]; then
  echo "Error: '$TARGET' no existe."
  exit 1
fi

find "$TARGET" -type f -perm -0002 -print > "$OUTPUT" 2>/dev/null

NUM=$(wc -l < "$OUTPUT" 2>/dev/null || echo 0)
echo "He guardado $NUM rutas en '$OUTPUT'."
