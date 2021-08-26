#!/bin/bash
TOOL_BIN_DIR=./bin
declare -i cmp=0
#check if STM32_Programmer_CLI.exe is existed
if [ ! -f "${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe" ]
then
	echo "COMMAND STM32_PROGRAMMER_CLI.EXE NOT FOUND"
	exit 1;
fi
#check if device is connected 
ResStatus="$(${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe -c port=swd ap=0 mode=HOTPLUG freq=1000 -r32 0x2400003c 1 | grep -ni "error")"
if [ $? -eq 0 ]
then
	echo "DEVICE IS NOT CONNECTED"
	exit 2;
fi
#start test
echo "TEST IS STARTED !!"
while [ $cmp -lt 8 ]
do
	ResStatus="$(${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe -c port=swd ap=0 mode=HOTPLUG freq=1000 -r32 0x2400003c 1 | sed -n '24p' | cut -d ':' -f2)"
	if [ $ResStatus -eq 2 ] || [ $ResStatus -eq 3 ]
	then
		ResStatus="$(${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe -c port=swd ap=0 mode=HOTPLUG freq=1000 -w32 0x2400003c 0x00000000)"
		echo "GET TEST RESULT !!!"
		TabRes="$(${TOOL_BIN_DIR}/STM32_Programmer_CLI.exe -c port=swd ap=0 mode=HOTPLUG freq=1000 -r8 0x2400002c 10 | sed -n '19p' | cut -d ':' -f2)"
		cmp=0
		for ctr in $TabRes 
		do 
			cmp=cmp+1
			if [ $ctr -eq 0 ]
			then			
				echo "TEST $cmp  :  PASSED"
			elif [ $ctr -eq 1 ]
			then
				echo "TEST $cmp  :  FAILED"
			else
				echo "TEST $cmp  :  NOT SUPPORTED"
			fi
		done
	fi
     
done