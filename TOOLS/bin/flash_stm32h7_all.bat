set DIR_CUBE_P=..\
STM32_Programmer_CLI.exe -c port=swd  ap=0 mode=UR freq=950 RDP=0xAA 
STM32_Programmer_CLI.exe -c port=swd  ap=0 mode=UR freq=950  -e all
STM32_Programmer_CLI.exe -c port=swd  ap=0 mode=UR freq=950 -e all –el iCareLoader.stldr