#!/bin/bash
# cylonbar: Cylon inspired progress bar
SPEED=0.1
BARCAR="-"
CAR="*"

help(){
    echo "progbar <pid> <bar_length>"
    echo -en "\nexecution exaample:\nsleep 5s & cylonbar \$! 10\n"
    exit 1
}

prepare_bar_length(){
    for i in `seq 0 $barlength`;do
        bar=$bar$BARCAR
    done
}
##########
# Main
##########

# check arguments
if [ $# -ne 2 ];then
    help
fi
barlength=$(($2-1))
pid=$1

prepare_bar_length

switch=0 # 0 move to right, 1 move to left
cont=0
#wait for $PID to stop
while [ -d /proc/$pid ];do
    #draw bar (red)
    echo -en "\033[0;31m${bar:0:$cont}$CAR${bar:$cont+1:$barlength}\033[0m" 

    # increment or decrement cont to move right or left
    [ $switch -eq 0 ] && cont=$(($cont+1)) || cont=$(($cont-1))

    # if cont reach bar limits switch counter to change direction
    # switch instruction works by doing a xor
    [[ $cont -eq $barlength || $cont -eq 0 ]] && switch=$((switch ^ 1))

    sleep $SPEED 

    # delete progress bar for redrawing (using ansi / escape chars
    echo -en "\033[1K\r"
done

