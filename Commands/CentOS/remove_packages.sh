#!/usr/bin/bash

#Deklarace dočasných souborů jako proměnných
FAP=$HOME/all_packages.txt
FTEMP=$HOME/temp_packages.txt
FPROT=$HOME/protected_packages.txt
FLOG=$HOME/log_package_removal.txt
DIRPROT=$HOME/protected_dirs.txt

#Deklarace proměnných, jež jsou použity pro zjištění statusu daného balíčku
i=0
j=1

#Vložení balíčku NetworkManager do chráněné složky
echo "NetworkManager" > /etc/dnf/protected.d/NetworkManager.conf

#Výpis všech aresářů chráněných balíčků do souboru
ls /etc/dnf/protected.d/ > $DIRPROT

#Načtení všech chráněných programových balíčků ze souborů a jejich spočtení, jež je později použito pro zjištění statusu balíčku
while read protected
 do
  cat /etc/dnf/protected.d/"$protected" >> $FPROT
  ((j=j+1))
 done < $DIRPROT

#zjištění jmen všech balíčků
rpm -qa --queryformat '%{NAME}\n' > $FAP

echo "Removing unused packages, this might take a while, maybe have a cup of tea."
#Zde dochází ke čtení souboru se všemi balíčky řádek po řádku a zjišťují se jejich závislosti, zde jsou mazány tak zvané osamnělé balíčky, takže balíčky bez závislostí, nalezená závislost je vypsána do temp souboru
while read package
 do
  dnf repoquery --installed --queryformat '%{name}\n' --whatrequires $package > $FTEMP
  while read protpac
   do
    #Kontrola zda není aktálně zkoumaný balíček chráněn
	  if [ $package != $protpac ]; then
	   ((i=i+1))
	  else
	   ((i=0))
	  fi
   done < $FPROT
   #Jestliže někde v průběhu zkoumání chráněnosti balíčku došlo k nalezení shody s jakýmkoliv chráněným balíčkem, tak se pohnulo počítadlo a tedy se nerovnají => Balíček je chráněn
   if [ $i -ne $j ]; then
	  echo "$package is PROTECTED" >> $FLOG
   #Zde se zkoumá, je-li soubor temp prázdný, jestliže prázdný není, tak to znamená, že je v něm uložena závislost a tedy není osamělý balíček a nebudeme jej odstraňovat
   elif [ -s $FTEMP ]; then
    echo "$package has some dependencies" >> $FLOG
   else
   #V jakémkoliv jiném případě se jedná o osamělý balíček, jež je možno odstranit
    echo "$package was an IMPOSTOR" >> $FLOG
	dnf remove -y $package
   fi
  ((i=0))
 done < $FAP
((j=1))

#Mazání Dočasných souborů
rm -frv $FAP
rm -frv $FTEMP
rm -frv $FPROT
rm -frv $FLOG
rm -frv $DIRPROT
