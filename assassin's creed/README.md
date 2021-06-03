# How to use

1) Edit assassinscreed.sh and set APPDIR and WINEPATH variables
2) Configure a wine prefix using assassinscreed.sh -c
3) Then, install the game in C:\game
4) Launch the game with assassinscreed.sh -s
5) Enjoy

# Gamepad Mad Catz Xbox 360 Controller

Have some trouble whith my gamepad. /dev/input/js0 and /dev/input/event24 invert RX and RZ axis, i recalibrate that with jstest-gtk.

# Misc

To change screen to use in fullscreenmode, use xrandr to switch primary screen
  xrandr --output HDMI-0 --primary --right-of DVI-I-0

Language is on system.reg. If you make a clean wineprefix after the installation, you will loose language parameter. Edit it with regedit, or with the following command :
/opt/wine-staging/bin/wine reg ADD "HKLM\Software\Wow6432Node\Ubisoft\Assassin's Creed" /v Language /d French /f

Just use a fresh install of wine
Installation of PhysX and dxvk are optionnal, work with d3dcompiler_47 only

I limit my FPS at 60 for power consumption. To do that, i add dxvk.conf file with "dxgi.syncInterval = 1" (need dxvk installed)

MSAA cannot be enabled if the resolution is set too high (this is an issue on Windows as well). To fix it, i edit Assassin.ini  in save/Ubisoft/Assassin\'s\ Creed/ and set Multisampling=2

# Tested on :

debian 11/testing \
wine-staging 6.9 \
dxvk 1.8.1

# Usefull Links :

https://appdb.winehq.org/objectManager.php?sClass=application&iId=6807 \
https://www.protondb.com/app/15100 \
https://lutris.net/games/assassins-creed/
