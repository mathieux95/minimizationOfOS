#!/usr/bin/bash

#Smazání souborů rescue
find /boot -type f -name "*rescue*" -delete

#Vygenerování nového bootovacího menu
grub2-mkconfig -o /boot/grub2/grub.cfg
