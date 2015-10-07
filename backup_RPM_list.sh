#!/bin/bash

: '

Making RPM package list current at running time
Useful for seeing which package corrupts system

@author: ubbn
@date: 2012-03-10

'
# Printer function
function printLog (){
	NOW=$(date +%Y-%m-%d%t%H:%M:%S)
	
	echo -e "$NOW\t$1"
}

# Main function
function main(){
	ODOO=$(date +%Y-%m-%d_%H%M%S)
	OUTPUT="list_rpm_"$ODOO
	OUTDIR=$HOME/Documents

	printLog "Preparing rpm list output"
	rpm -qa -last > $OUTDIR/$OUTPUT

	printLog "Output dir: $OUTDIR"
	printLog "Finished, saved as: $OUTPUT"
}


main

