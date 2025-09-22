#!/bin/bash
# tar -cvzf date_etc.tar.gz ./etc/cosas2

dia='date +"%d/%m/%Y"'


read -p "Que directorio: " dir

echo '$dia_$dir.tar.gz'

tar -cvzf "$dia_$dir.tar.gz"  ./"$dir"
