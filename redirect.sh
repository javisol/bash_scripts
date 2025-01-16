#!/bin/bash
FILE=./output.log
exec >> ${FILE} 2>&1
echo "Redirecting standard output to a file"
echo "Redirecting error output to a file" >& 2
echo "This one to another file" > ./output2.log
source ./redirect2.sh "source"
exec >> ${FILE} 2>&1
./redirect2.sh "regular call"