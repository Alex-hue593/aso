#!/bin/bash

if [[ $(date  +%k) -gt 8 && $(date +%k) -lt 15 ]]; then
	echo  "Buenos dias"

elif [[ $(date  +%k) -gt 15 && $(date  +%k) -lt 20 ]]; then
	echo "Buenas tardes"

else
	echo "Buenas noches"

fi
