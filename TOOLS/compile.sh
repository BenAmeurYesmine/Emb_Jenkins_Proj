#!/bin/bash
MAKE_BIN_DIR=../TOOLS
MAKEFILE_DIR=../Debug

#update makefile compiler's path
sed -i 's/arm-none-eabi/..\/TOOLS\/gcc-arm-none-eabi\/bin\/arm-none-eabi/g' ../Debug/makefile
if [ $? -ne 0 ]
then 
	echo " Can't updated Makefile "
   exit 1
fi

Res=$(cd ${MAKEFILE_DIR} &&  ${MAKE_BIN_DIR}/make.exe clean)s
if [ $? -ne 0 ]
then 
	echo "can't clean"
   exit 2
fi
echo "Clean done"

#recover makefile compiler's path
sed -i 's/..\/TOOLS\/gcc-arm-none-eabi\/bin\/arm-none-eabi/arm-none-eabi/g' ../Debug/makefile
if [ $? -ne 0 ]
then 
	echo " Can't updated Makefile "
   exit 3
fi

Res=$(cd ${MAKEFILE_DIR} &&  ${MAKE_BIN_DIR}/make.exe all)
if [ $? -ne 0 ]
then 
	echo "Can't make makefile"
   exit 4
fi
# Res=$(${MAKE_BIN_DIR}/make.exe -C ${MAKEFILE_DIR} )
echo "$Res"
