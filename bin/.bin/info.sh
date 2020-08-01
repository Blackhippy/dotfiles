#!/bin/bash
#
# Minimalist sysinfo script
#################################
 
# color escapes
BLK="\e[30m"
RED="\e[31m"
GRN="\e[32m"
YLW="\e[33m"
BLU="\e[34m"
PUR="\e[35m"
CYN="\e[36m"
BRED="\e[31m"
BGRN="\e[32m"
BYLW="\e[33m"
BBLU="\e[34m"
BPUR="\e[35m"
BCYN="\e[36m"
WHT="\e[37m"
RST="\e[0m"
 
# build the color bars
BAR="━━━━━"
((LEN = ${#BAR} * 6))
OUTT="$RED$BAR$GRN$BAR$YLW$BAR$BLU$BAR$PUR$BAR$CYN$BAR$RST"
OUTB="$BRED$BAR$BGRN$BAR$BYLW$BAR$BBLU$BAR$BPUR$BAR$BCYN$BAR$RST"
 
# array for info entries
ENTS=()
 
# function for creating entries
mkent() {
    if [[ "$#" != 2 ]]; then
        printf "!! invalid number of arguments to make_entry().\n"
        exit
    fi
 
    local ENT="$2"
    while ((${#ENT} < LEN - ${#1})); do
        ENT=" $ENT"
    done
 
    ENT="$CNAME""$1""$CTEXT""$ENT""$RST"
    ENTS+=("$ENT")
}
 
 
# entry settings
CNAME="$BLU" # color of entry name
CTEXT="$WHT" # color of entry text
 
#
# add entries here!
# format: mkent NAME TEXT
#
# examples:
#
mkent "OS" "Arch Linux"
mkent "WM" "2bwm"
mkent "Font" "Victor Mono"
mkent "Kernel" "Linux 5.4.1"
mkent "Stamp" "$(date '+%d %b')"
 
# find the center of the screen
COL=$(tput cols)
ROW=$(tput lines)
((PADY = ROW / 2 - 1 - ${#ENTS[@]} / 2))
((PADX = COL / 2 - LEN / 2))
 
for ((i = 0; i < PADX; ++i)); do
    PADC="$PADC "
done
 
for ((i = 0; i < PADY; ++i)); do
    PADR="$PADR\n"
done
 
# print everything
 
# but clear the screen first
clear
 
# vertical padding
printf "%b" "$PADR"
 
# sysinfo
printf "%s%b" "$PADC" "$OUTT\n"
for ENT in "${ENTS[@]}"; do
    printf "%s%b" "$PADC" "$ENT\n"
done
printf "%s%b" "$PADC" "$OUTB\n"
 
# hide the cursor and wait for user input
tput civis
read -n 1
 
# give the cursor back
tput cnorm
