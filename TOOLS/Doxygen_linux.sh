#!/bin/bash

Doxyfile=./Doxyconfig

Res=$(doxygen $Doxyfile);
if [ $? -eq 0 ]
then
	echo "HTML GENERATED SUCCESFULLY";
else 
	echo "DOXYGEN FAILED";
	exit 2;
fi
