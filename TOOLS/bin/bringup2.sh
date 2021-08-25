#!/bin/bash
declare -i cmp=0
while [ $cmp -lt 8 ]
do
	ResStatus="$(./STM32_Programmer_CLI.exe -c port=swd ap=0 mode=HOTPLUG freq=1000 -r32 0x2000003c 1 | sed -n '24p' | cut -d ':' -f2)"
	if [ $? -eq 0 ]
	then
		if [ $ResStatus -eq 2 ] || [ $ResStatus -eq 3 ]
		then
			ResStatus="$(./STM32_Programmer_CLI.exe -c port=swd ap=0 mode=HOTPLUG freq=1000 -w32 0x2000003c 0x00000000)"
			echo "GET TEST RESULT !!!"
			TabRes="$(./STM32_Programmer_CLI.exe -c port=swd ap=0 mode=HOTPLUG freq=1000 -r8 0x2000002c 10 | sed -n '19p' | cut -d ':' -f2)"
			cmp=0
			for ctr in $TabRes 
			do
				cmp=cmp+1
				echo "Test $cmp  $ctr"
			done
		fi
    fi
    
    
done