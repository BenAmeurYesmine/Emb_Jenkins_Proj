#!/bin/bash

BIN_DIR=./Doxygen/bin
Doxyfile=./Doxyconfig

if [ ! -f "${BIN_DIR}/doxygen.exe" ];
then
	echo "DOXYGEN NOT FOUND";
	exit 1;
fi

Res=$(${BIN_DIR}/doxygen.exe $Doxyfile);

