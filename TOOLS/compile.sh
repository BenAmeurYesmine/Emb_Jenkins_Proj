#!/bin/bash
MAKE_BIN_DIR=./bin
MAKEFILE_DIR=../Debug
Res=$(${MAKE_BIN_DIR}/make.exe -C ${MAKEFILE_DIR} )
echo "$Res"