#!/bin/bash

arch="lista.txt"

read -p "Elija una opción: añadir, buscar, listar, ordenar, borrar: " opcion

case $opcion in
	añadir)
	read -p "Añada un registro: \"nombre\" \"Dirección\" \"Registro\": " cont
	echo $cont >> $arch
	;;

	buscar)
	read -p "Nombre, dirección o registro: " obj
	grep $obj $arch
	;;

	listar)
	cat  $arch
	;;

	ordenar)
	sort $arch
	;;

	borrar)
	rm $arch
	;;
esac

