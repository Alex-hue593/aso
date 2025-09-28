#!/bin/bash

existe() {
  local fichero="$1"

  if [ -e "$fichero" ]; then
    if [ -f "$fichero" ]; then
      echo "El fichero '$fichero' existe. Ajustando permisos..."

      if chmod u+x,g-x,o-x "$fichero" 2>/dev/null; then
        echo "Permisos cambiados: ahora solo el propietario puede ejecutar '$fichero'."
        return 0
      else
        echo "Error: no se pudieron cambiar los permisos (permiso denegado)."
        return 2
      fi

    else
      echo "El path '$fichero' existe pero NO es un fichero regular."
      return 3
    fi
  else
    echo "El fichero '$fichero' NO existe."
    return 1
  fi
}

if [ $# -lt 1 ]; then
  echo "Uso: $0 <ruta_fichero>"
  exit 1
fi

archivo="$1"
existe "$archivo"
exit $?
