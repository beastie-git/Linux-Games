# How to use

1) Edit assassinscreed.sh and set APPDIR and WINEPATH variables
2) Configure a wine prefix using assassinscreed.sh -c
3) Then, install the game in C:\game
4) Launch the game with assassinscreed.sh -s
5) Enjoy

# Gamepad Mad Catz Xbox 360 Controller

After game install, add this lines to /$GAME_INSTALL_DIR/DefaultBindings.map
```
[Mad Catz Xbox 360 Controller]
VendorID=7085
ProductID=61462
Button1=0
Button2=2
Button3=3
Button4=1
PadUp=64
PadRight=65
PadDown=66
PadLeft=67
Select=6
Start=7
ShoulderLeft1=4
ShoulderLeft2=10
ShoulderRight1=5
ShoulderRight2=11
StickLeft=8
StickRight=9
LeftStickUp=130
LeftStickDown=130
LeftStickLeft=129
LeftStickRight=129
RightStickUp=133
RightStickDown=133
RightStickLeft=132
RightStickRight=132
```
Or edit your in game profile binding map file :
/$WINEPREFIX/drive_c/users/$USER/Application\ Data/Ubisoft/Assassin\'s\ Creed/Saved\ Games/1623029687.map

For more details, please visit this thread : https://bugs.winehq.org/show_bug.cgi?id=50664



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
