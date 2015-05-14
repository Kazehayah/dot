f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

gtkrc="$HOME/.gtkrc-2.0"
GtkTheme=$( grep "gtk-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkIcon=$( grep "gtk-icon-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkFont=$( grep "gtk-font-name" "$gtkrc" | cut -d\" -f2 )

# Wallpaper set by feh
Wallpaper=$(cat ~/.fehbg | cut -c 16-70)

# Settings from ~/.Xdefaults
xdef="~/.Xdefaults"
TermFont="$(grep 'font' ~/.Xdefaults | awk '{print $2}' | cut -d ":" -f2 | cut -d ":" -f1)"

# Time and date
time=$( date "+%H.%M")
date=$( date "+%a %d %b" )

# OS
OS=$(uname -r)
dist=$(cat /etc/*-release | grep -i name | cut -d'=' -d'"' -f2 | sed -n 1p)
bit=$(uname -m)

# WM version
wm=$(wmctrl -m | grep -i name | awk '{print $2}')

# Other
UPT=`uptime | awk -F'( |,)' '{print $2}' | awk -F ":" '{print $1}'`
uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
uptime2=$(uptime | sed -nr 's/.*\s+([[:digit:]]{1,2}):[[:digit:]]{2},.*/\1/p')
size=$(df | grep '^/dev/[hs]d' | awk '{s+=$2} END {printf("%.0f\n", s/1048576)}')
use=$(df | grep '^/dev/[hs]d' | awk -M '{s+=$3} END {printf("%.0f\n", s/1048576)}')
gb=$(echo "G")
pac=$(pacman -Qe | wc -l)
pacman=$(pacman -Q | wc -l)
COUNT=$(cat /proc/cpuinfo | grep 'model name' | sed -e 's/.*: //' | wc -l)
cpu=$(lscpu | grep 'Model name' | awk -F ':' '{print $2}' | cut -c13-40)
#laptop=$(dmidecode | grep Product)
lap1=$(cat /sys/class/dmi/id/sys_vendor)
lap2=$(cat /sys/class/dmi/id/product_name)
vga=$(lspci | grep -i vga | cut -c62-75)
memkb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
ram=$(expr $memkb / 1024)

cat << EOF    
                                                                                                                               
$f7$d 	   .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
$f7	  MM                                           MM
$f7	 MM                                             MM 
$f7	 MM   $f4 MMMMM   MM MMMMMM .dOkc  MM  MM   $f7    MM   
$f7	 MM   $f4 0M  MM  MM   MM   KX  Ml MM  MM    $f7    MM  
$f7   	 MM  $f4  MMmmW.  MM   MM   X0     MM  MM $f7    MM     
$f7	 MM   $f1 MMMMMM  MM   MM   X0     MKMMMM     $f7     MM
$f7	 MM   $f1 MM  WN  MM   MM   KK  Ml Mk  MM     $f7     MM
$f7	 MM  $f1  MMMMM'  MM   MM   '0XXx' Xd  XM  M  M $f7   
$f7	 MM                                             MM 	  
$f7	 cK;                                           MM
$f7    	.OW.....:MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  

       
EOF
