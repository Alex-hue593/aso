#!/bin/bash

echo "Últimos usuarios que iniciaron sesión con IP de origen:"
last | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}'
