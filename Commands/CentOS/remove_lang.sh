#!/usr/bin/bash

#Odstranění všech jazykových sad, kromě používané (en_US)
find /usr/share/locale/ -maxdepth 1 -not -name "*en_US*" -exec rm -frv {} +
