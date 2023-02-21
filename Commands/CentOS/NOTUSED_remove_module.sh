#!/usr/bin/bash

#Jedná se o skript na odstranění nepoužívaných modulů jádra, který se bohužel ani po několika hodinách práce nepodařilo odladit, tak aby po jeho spuštění bylo možné nainstalovat a spustit xinit, ale myslím si, že je poměrně zajímavý, tak jej sem dávám pro zajímavost.

#Vytváření dočasných souborů.
FAMI=$HOME/all_modules_info.txt
FUM=$HOME/used_modules.txt
FUMI=$HOME/used_modules_info.txt
FAMS=$HOME/all_modules.sorted
FUMS=$HOME/used_modules.sorted
FMTR=$HOME/modules_to_remove.txt

#Vyhledávání všech dostupných modelů jádra.
find /lib/modules/ -type f -name "*.ko*" > $FAMI

#Vyhledávání všech používaných modulů jádra.
lsmod | grep -v 0 | grep -v "Module" | cut -f1 -d " " > $FUM

#Vyhledávání cest používaných modulů jádra.
while read modline
 do
  modinfo "$modline" -n >> $FUMI
 done < $FUM
 
#Seřazení obsahu souborů.
sort $FAMI | uniq > $FAMS
sort $FUMI | uniq > $FUMS

#Porovnávání používaných a veškerých modulů jádra a jejich fitrace
comm -23 $FAMS $FUMS > $FMTR

#Vymazání přebytečných modulů.
while read delline
 do
  rm -frv "$delline"
 done < $FMTR
 
#Mazání dočasných souborů.
rm -frv $FAMI
rm -frv $FUM
rm -frv $FUMI
rm -frv $FAMS
rm -frv $FUMS
rm -frv $FMTR
