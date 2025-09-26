#!/bin/bash

sed -n '/error/p' /var/log/syslog | head -n 5


