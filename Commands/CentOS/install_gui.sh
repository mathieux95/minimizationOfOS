#!/usr/bin/bash

#Instalace balíčků pro X Window System
dnf -y install xorg-x11-server-Xorg xinit xterm

#Instalace wget a tar balíčků
yum install -y wget
yum install -y tar

#Stažení archivu .tar pro prohlížeč palemoon
wget https://linux.palemoon.org/datastore/release/palemoon-29.4.6.linux-x86_64-gtk3.tar.xz

#Rozbalení archivy prohlížeče a odstranění archivu, kvůli úspoře místa
tar -xvf palemoon-29.4.5.1.linux-x86_64-gtk3.tar.xz
rm -frv  palemoon-29.4.5.1.linux-x86_64-gtk3.tar.xz

#Instalace dodatečných balíčků, jež jsou potřeba pro funkci palemoon webového prohlížeče
yum install -y gtk3
yum install -y dbus-glib

#Stažení rpm souboru pdf prohlížeče gv pfd viewer a jeho následná instalace
wget https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/g/gv-3.7.4-25.el8.x86_64.rpm
dnf install  gv-3.7.4-25.el8.x86_64.rpm

#Odstranění balíčků nano, tar a wget.
yum remove -y nano
yum remove -y tar
yum remove -y wget
