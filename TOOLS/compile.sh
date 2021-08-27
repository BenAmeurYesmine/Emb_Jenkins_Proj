#!/bin/bash
MAKE_BIN_DIR=../TOOLS/make/bin
MAKEFILE_DIR=../Debug


Update_Makefile()
{
List=("../Debug/Core/Src/subdir.mk" "../Debug/Core/Startup/subdir.mk" "../Debug/Drivers/STM32H7xx_HAL_Driver/Src/subdir.mk" "../Debug/makefile")

for path in "${List[@]}"; do
echo $path
sed -i 's/arm-none-eabi/..\/TOOLS\/gcc-arm-none-eabi\/bin\/arm-none-eabi/g' $path;
done
}

Undo_Makefile()
{
List=("../Debug/Core/Src/subdir.mk" "../Debug/Core/Startup/subdir.mk" "../Debug/Drivers/STM32H7xx_HAL_Driver/Src/subdir.mk" "../Debug/makefile")

for path in "${List[@]}"; do
echo $path
sed -i 's/..\/TOOLS\/gcc-arm-none-eabi\/bin\/arm-none-eabi/arm-none-eabi/g' $path;
done
}


#*******************
Update_Makefile;

Res=$(cd ${MAKEFILE_DIR} &&  ${MAKE_BIN_DIR}/make.exe clean);
if [ $? -ne 0 ]
then
echo "can't clean";
Undo_Makefile;
exit 2;
fi
echo "Clean done";

Res=$(cd ${MAKEFILE_DIR} &&  ${MAKE_BIN_DIR}/make.exe all);
if [ $? -ne 0 ]
then
echo "Can't make makefile";
Undo_Makefile;
  exit 3
fi

Undo_Makefile;