#!/bin/bash
# ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]

#El comando solo ocurrira si hay mas de 4 parametros
# $# es el numero de parametros
if [[ $# -lt 4 ]]; then
    echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1 
#    ^ comando que hace terminar el script para que no este todo en una condicion
fi

#datos que se entregan al introducir el comando
accion=$1
nombre=$2
apellido1=$3
apellido2=$4
grupo=$5

# Construir identificador aluXXYYZ con expresiones regulares
ide="alu${apellido1:0:2}${apellido2:0:2}${nombre:0:1}"

case "$accion" in
    alta)

#Si no se ha asignado un grupo, se creara luego uno que sea el identificador
        if [[ -z $grupo ]]; then
            grupo=$ide
        fi

# Crear grupo si no existe
        if ! getent group "$grupo" > /dev/null; then
            echo "Creando grupo $grupo..."
            sudo groupadd "$grupo"
            if [[ $? -ne 0 ]]; then
                echo "Error al crear el grupo $grupo"
                exit 1
            fi
        fi

# Crear usuario con identificador ide y asignar al grupo
        sudo useradd -m -g "$grupo" "$ide"
        if [[ $? -eq 0 ]]; then
            echo "Usuario $ide creado y asignado al grupo $grupo"
        else
            echo "Error al crear el usuario"
            exit 1
        fi
        ;;

    baja)
        # Eliminar usuario con identificador ide
        sudo deluser --remove-home "$ide"
        if [[ $? -eq 0 ]]; then
            echo "Usuario $ide eliminado"
        else
            echo "Error al eliminar el usuario"
            exit 1
        fi
        ;;

    *)
        echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
        exit 1
        ;;
esac

