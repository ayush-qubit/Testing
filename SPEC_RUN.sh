#!/bin/bash

clear

DRIVER="./build/testing"

for FILE in ./SPEC/*.ll;
do
	echo -e "${REDB}==============================Running Analysis================================${REDB} \n"
	FILENAME=$(basename $FILE .ll)
	echo -e $FILENAME
	$DRIVER $FILE
	echo -e "\n"
	echo -e "${REDB}==============================Analysis Over================================${REDB} \n"
done

# echo -e "${REDB}==============================Running Analysis================================${REDB} \n"
# $DRIVER ./outputs/$FILENAME.ll
# echo -e "\n"
# echo -e "${REDB}==============================Analysis Over================================${REDB}"