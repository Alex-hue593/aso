#!/bin/bash

obtener_red() {
    INTERFAZ=$(ip route | grep '^default' | awk '{print $5}')
    IP_CIDR=$(ip -o -f inet addr show $INTERFAZ | awk '{print $4}')
    
    IP=${IP_CIDR%/*}       # IP sin máscara
    MASCARA=${IP_CIDR#*/}  # prefijo CIDR

    BROADCAST=$(ip -o -f inet addr show $INTERFAZ | awk '{print $6}')

    echo "Interfaz utilizada: $INTERFAZ"
    echo "IP: $IP/$MASCARA"
    echo "Broadcast: $BROADCAST"
}

comprobar_ips() {
    local network_ip="$1"
    local cidr="$2"
    
    IFS=. read -r i1 i2 i3 i4 <<< "$network_ip"
    base=$((i1 * 256 ** 3 + i2 * 256 ** 2 + i3 * 256 + i4))
    
    HOSTS=$((2 ** (32 - cidr) - 2))
    
    echo "Comprobando $HOSTS IPs..."
    
    for ((i=1; i<=HOSTS; i++)); do
        NUM=$((base + i))
        IP_ACTUAL="$(( (NUM >> 24) & 255 )).$(( (NUM >> 16) & 255 )).$(( (NUM >> 8) & 255 )).$(( NUM & 255 ))"
        
        if ping -c 1 -W 1 "$IP_ACTUAL" &>/dev/null; then
            echo "$IP_ACTUAL -> OCUPADA"
        else
            echo "$IP_ACTUAL -> LIBRE"
        fi
    done
}

echo "Informe de la red del equipo"
obtener_red

INTERFAZ=$(ip route | grep '^default' | awk '{print $5}')
IP_CIDR=$(ip -o -f inet addr show $INTERFAZ | awk '{print $4}')
IP_RED=${IP_CIDR%/*}
CIDR=${IP_CIDR#*/}

comprobar_ips "$IP_RED" "$CIDR"
