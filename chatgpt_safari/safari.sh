#!/bin/bash
set -e
COLUMNS=80
LINES=24

# African safari characters
safari=("🦓" "🦒" "🐘" "🦏" "🦁")

# Initial positions for the safari animals
safari_pos=()
for ((i=0; i<${#safari[@]}; i++))
do
    # LINES, COLUMNS reversed
    safari_pos[i]=$(echo $((RANDOM%LINES)),$((RANDOM%COLUMNS)) | tr ' ' ',')
done

while true
do
    # Print the savanna
    # MDM: Wrong. Puts it in the corner
    printf "%*s\n" $COLUMNS "🌵🌾🌴"
#    for ((i=0; i<$COLUMNS; i++))
#    do
#      printf " 🌵 🌾 🌴 "
#    done
    # More correct, but prints too many
    printf "%0.s🌵🌾🌴" $(seq 1 $(($COLUMNS / 3)))
    # sides
    for ((i = 1; i < $LINES - 4; i++))
    do
        printf "🌵"
        printf "%*s"  $(($COLUMNS * 2 - 50)) "  "
        printf "🌴\n"
    done
    printf "%0.s🌵🌾🌴" $(seq 1 $(($COLUMNS / 3)))

    # Print the safari animals
    for ((i=0; i<${#safari[@]}; i++))
    do
        # Was using , not ;
        codes="\033[${safari_pos[i]}H${safari[i]}"
        new_codes=$(echo $codes | sed 's/,/;/g')
        printf $new_codes
    done
    # Move the safari animals
    for ((i=0; i<${#safari[@]}; i++))
    do
        safari_pos[i]=$(echo ${safari_pos[i]%,*} $(( ${safari_pos[i]##*,} + $((RANDOM%3-1)) )) | tr ' ' ',')
        # echo ${safari_pos[i]}
    done
    # Sleep for a short time
    sleep 0.3

    # Clear the screen
    printf "\033c"
done
