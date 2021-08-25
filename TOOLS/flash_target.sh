#!/bin/bash
TOOL_BIN_DIR=./bin
BIN_DIR=../Debug


Res=$(${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe -c port=swd  ap=0 mode=UR freq=1000 -e all -log erase_flash.log)
if [ $? -eq 0 ]
then
	echo "erase is done successfully"
	Res=$(${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe -c port=swd ap=0 mode=UR freq=1000 -w ${BIN_DIR}/Emb_Jenkins_Proj.bin 0x08000000 -log prog_flash.log)
	if [ $? -eq 0 ]
	then
		echo "flashing is done successfully"
		Res=$(${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe -c port=swd  ap=0 mode=UR freq=1000 --start 0x08000000)
		if [ $? -eq 0 ]
		then
			echo "application is started successfully"
		else
			echo "application is not started"
		fi
	else
		echo "flashing is failed"
	fi
else
	echo "erase is failed"
fi
