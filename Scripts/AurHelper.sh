#!/bin/bash
clear
aur_helper=("apacman" "aura" "aurelaurget" "aurquery" "aurutils" "bauerbill" "burgaur" "cower" "pacaur" "packer" "pbget" "pkgbuilder" "prm" "trizen" "wrapaur" "yaah" "yaourt")
for i in ${aur_helper[*]}; do
  if [ -f "/usr/bin/$i" ]; then
   echo "$i"
  fi 
done
