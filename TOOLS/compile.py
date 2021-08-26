import os
import sys
import shutil

#jenkins_job=sys.argv[1]
#stm_project=sys.argv[2]
#ref="\\"+sys.argv[3]
#cortex=sys.argv[4]
build_target=sys.argv[1]
#path  ="C:\\Users\\ASUS\\.jenkins\\workspace\\"+jenkins_job+"\\"+build_target
path  ="..\\"+build_target
os.chdir(path)

os.environ["PATH"]+=os.pathsep + os.pathsep.join(["C:\\dev\\tools\\make-3.81\\bin"])
os.environ["PATH"]+=os.pathsep + os.pathsep.join(["C:\\dev\\tools\\gcc-arm-none-eabi-10.3-2021.07\\bin"])
path ="..\\TOOLS\\bin"
os.chdir(path)
os.system("make ..\\Debug\\makefile")


