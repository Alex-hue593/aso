#!/bin/bash


read -p " Escoja una: sumar, restar, multiplicar, dividir: " opcion
read -p "Numero 1: " n1
read -p "Numero 2: " n2

case $opcion in 
	sumar) 
		result=$((n1 + n2))
		echo "$result"
	;;
	restar) 
		result=$((n1 - n2))
		echo "$result"
	;;
	multiplicar) 
		result=$((n1 * n2))
		echo  "$result"
	;;
	dividir) 
		result=$((n1 / n2))
		echo  "$result"

	;;
	*) 
	echo "no es una opción"
	;;
esac
