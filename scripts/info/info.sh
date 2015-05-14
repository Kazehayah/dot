f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

c00=$'\e[0;30m'
c01=$'\e[0;31m'
c02=$'\e[0;32m'
c03=$'\e[0;33m'
c04=$'\e[0;34m'
c05=$'\e[0;35m'
c06=$'\e[0;36m'
c07=$'\e[0;37m'
c08=$'\e[1;30m'
c09=$'\e[1;31m'
c10=$'\e[1;32m'
c11=$'\e[1;33m'
c12=$'\e[1;34m'
c13=$'\e[1;35m'
c14=$'\e[1;36m'
c15=$'\e[1;37m'

fi=$'\e[1;30m'
fa=$'\e[1;37m'
fu=$'\e[0;37m'

gtkrc="$HOME/.gtkrc-2.0"
GtkTheme=$( grep "gtk-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkIcon=$( grep "gtk-icon-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkFont=$( grep "gtk-font-name" "$gtkrc" | cut -d\" -f2 )

# Wallpaper set by feh
#Wallpaper=$(cat ~/.fehbg | cut -c 16-70)

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
pkgnum=$(pacman -Q|wc -l)
cpuspe=$(grep 'model name' /proc/cpuinfo| sed 1q|sed 's/^.*:\ *//')
termfn=$(cat $HOME/.Xresources | grep -v ! | awk '/*font/ {print $2}' | sed 's/xft://;s/:pixelsize//;s/=/\ /')
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


initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[1;30m";   redb="${esc}[1;31m";    greenb="${esc}[1;32m"
  yellowb="${esc}[1;33m"   blueb="${esc}[1;34m";   purpleb="${esc}[1;35m"
  cyanb="${esc}[1;36m";    whiteb="${esc}[1;37m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}
numbers (){

initializeANSI

cat << EOF

${blackf}${reset} ${redf}${reset} ${greenf}${reset} ${yellowf}${reset} ${bluef}${reset} ${purplef}${reset} ${cyanf}${reset} ${whitef}${reset}
${blackb}${reset} ${redb}${reset} ${greenb}${reset} ${yellowb}${reset} ${blueb}${reset} ${purpleb}${reset} ${cyanb}${reset} ${whiteb}${reset}

EOF

}

cat << EOF    	    
$f7	   		$f6 $USER $f7| $f1$HOSTNAME
$f7	  	$f6 Kernel    »$f4  $OS$NC $bit
$f7	  	$f6 WM 	   »$f4  $wm
$f7		$f6 shell     » $f4 $SHELL
$f7  		$f6 Gtk Theme » $f4 $GtkTheme
$f7	  	$f6 Icon      » $f4 $GtkIcon
$f7		$f6 VGA 	   » $f4 $vga
$f7		$f6 Uptime    » $f4$uptime
$f7		$f6 Term 	   » $f4 $TERM
$f7		$f6 Package   » $f4 $pkgnum
$f7	  	$f6 Font      »  $f4$TermFont
$f7	  	$f7     $f7|$f4$cpu$f7|   	         
EOF

blocks (){

initializeANSI

cat << EOF

	${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}
	${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}
	${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}
EOF
}

case $1 in
	b)	blocks;;
	a)	blocks && numbers;;
	*)  blocks && numbers;;
esac

