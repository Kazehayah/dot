#!/bin/bash
#
# simple todo script
#
# ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ xero <x@xero.nu>
# ░▓ code ▓ http://code.xero.nu/todo
# ░▓ mirror ▓ http://git.io/todo
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
 
file="/tmp/todo"
( [ -e "$file" ] || touch "$file" ) && [ ! -w "$file" ] && echo cannot write to $file && exit 1
if [[ -z $1 || $1 == "--help" || $1 == "-h" || $1 == "help" ]]; then
echo "┌──────[ todo ]──[ version 0.0.1 ]─────── ─ ─"
echo "│ usage: todo <options>"
echo "│ author: xero harrison - http://xero.nu"
echo "├────────────────[ options ]"───────────── ─ ─
echo "│ -s, --show display the todo list"
echo "│ -a, --add <string> add a todo item"
echo "│ -d, --delete <number> delete a todo item"
echo "│ -h, --help display this screen"
echo "└──────────────────────────────────────── ─ ─"
elif [[ $1 = '--show' || $1 = '-s' || $1 == "show" ]]; then
while true;
do
clear
echo ""
echo " ██ ██"
echo " ░██ ░██"
echo " ██████ ██████ ██████ ██████"
echo " ░░░██ ░██░░░░██░██░░░██░██ ░██"
echo " ░██ ░██ ░██░██ ░██░██ ░██"
echo " ░░██ ░░██████ ░░██████░░██████"
echo " ░░ ░░░░░░ ░░░░░░ ░░░░░░"
echo ""
echo " _ __ __________________ __ _"
echo ""
nl -b a $file
sleep 4
done;
elif [[ $1 = '--delete' || $1 = '-d' || $1 == "delete" ]]; then
if [[ -z $2 ]]; then
echo "missing option"
echo "pass an item number to delete"
else
sed -e $2'd' -i $file
fi
elif [[ $1 = '--add' || $1 = '-a' || $1 == "add" ]]; then
if [[ -z $2 ]]; then
echo "missing option"
echo "pass an item to add"
else
echo $2 >> $file
fi
else
echo "unknown option"
echo "call 'todo --help' for more info"
fi
exit 