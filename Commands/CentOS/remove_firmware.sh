#!/usr/bin/bash

#Odstranění nepoužívaného firmwaru
find /usr/lib/firmware -atime +2 -delete
