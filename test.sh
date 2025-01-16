#!/bin/bash
echo hola
for i in $(seq 1 5);do
    sleep 1
    echo -en "\033[1K\r"
    echo -en "\033[0;31mGenerating $i seconds\033[0m"
done
echo 
echo adios
