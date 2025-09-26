#!/bin/bash

sed '/^#/d' /etc/services
sed '/^$/d' /etc/services
