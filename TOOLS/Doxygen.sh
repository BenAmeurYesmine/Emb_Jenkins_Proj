#!/bin/bash

BIN_DIR=./Doxygen/bin
Doxyfile=./Doxyconfig

if [ ! -f "${BIN_DIR}/doxygen.exe" ];
then
	echo "DOXYGEN NOT FOUND";
	exit 1;
fi

Res=$(${BIN_DIR}/doxygen.exe Doxyfile);
if [ $? -eq 0 ]
then
	echo "HTML GENERATED SUCCESFULLY";
else 
	echo "DOXYGEN FAILED";
	exit 2;
fi
