#!/bin/sh

# Define your battery device. Look up in '/sys/class/power_supply/' for a directory named 'BAT0' ( it also can be 'BAT1 or something else )
#device='BAT0'
#battery="$(cat /sys/class/power_supply/$device/capacity)%"

# Volume Status for alsa users
#volume="$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"



# How many spaces do you want before the battery status ?
#spaces=50

# Automating the number of spaces
#function auto_space
#
#for ((i = 0; i <= $spaces; i++)); do
#  printf ' '
#done
#}

# Define your preferred terminal
terminal='urxvt -e'

# Menu Order.
menu_list="File\\nWall\nWeb\nTerm\nGimp\nMusic\nHtop\nRanger\nShot\nLogout\nShutdown\nReboot"
menu_list2="Logout\nReboot\nShutdown"

# Dmenu Preferences
Dmenu="dmenu -p '»»»»' -i -b -h 24 -l 12 -w 200 -dim 0.1 -x 50 -y 400 -fn 'ohsnap' -i -nb '#101010' -sb '#E06179' -nf '#FFFFFF' -sf '#FFFFFF'"

asuh=$(echo -e "$menu_list" | eval $Dmenu)



case $asuh in
  File)
    thunar ;;
  Wall)
    nitrogen ;;
  Web)
    firefox ;;
  Ranger)
    $terminal ranger ;;
  Htop)
    $terminal htop ;;
  Term)
    urxvt ;;
  Gimp)
    gimp ;;
  Music)
    $terminal ncmpcpp ;; 
  Shot)
	scrot 'asuh.png' -e 'mv $f ~/Pictures/' && notify-send 'Scrot Saved !' ;;
   Logout) 
    pkill xmonad & ;;
  Shutdown)
   shutdown -h now & ;;
  Reboot)
   shutdown -r now & ;;
  
    
esac
