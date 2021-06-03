#!/bin/bash

APPDIR="/games/assassinscreed"
WINEDIR="/opt/wine-staging/bin"
WINEPATH="$WINEDIR/wine"

export WINE="$WINEPATH"
export WINEARCH="win64"
export WINEPREFIX="$APPDIR/wine"
export WINEDEBUG="-all"
export DXVK_LOG_LEVEL="none"
# export DXVK_HUD=full

function help() {
  cat <<EOF
assassinscreed.sh v1.0 is small script to configure wine and launch Assassin's Creed: Director's Cut Edition

## USE :

  assassinscreed.sh [OPTIONS]

## OPTIONS can be :

  -s, --start     : start Assassin's Creed: Director's Cut Edition
  -c, --configure : Configure wine environnement for Assassin's Creed: Director's Cut Edition
  -h, --help      : Print this help

assassinscreed.sh v 1.0 Copyright (C) 2021 beastie(beastie@unixyourbrain.org)
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.
EOF
  exit 0
}

function configure {
  mkdir $APPDIR/game
  mkdir $APPDIR/save
  $WINEDIR/wineboot
  cd $APPDIR/wine/drive_c
  ln -s ../../game/ game
  cd $APPDIR/wine/drive_c/users/root/
  rm "My Documents"
  ln -s ../../../../save "My Documents"
  rm  -fr "Application Data"
  ln -s ../../../../save "Application Data"
  winetricks -q d3dcompiler_47 physx dxvk # physx and dxvk are optionnal
  echo "dxgi.syncInterval = 1" > $APPDIR/game/dxvk.conf
  $WINEDIR/wineboot
}

function start {
  cd $APPDIR/game
  $WINEPATH AssassinsCreed_Dx10.exe
}

#############################################
# MAIN ######################################
#############################################
if [ $1 ]
then
  case $1 in
    -s|--start)
      start
      ;;
    -c|--configure)
      configure
      ;;
    -h)
      help
      ;;
  esac
else
  help
fi
