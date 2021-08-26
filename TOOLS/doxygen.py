import os
import sys

jenkins_job= sys.argv[1]
path  ="C:\\Users\\ASUS\\.jenkins\\workspace\\Emb_Jenkins_Proj_Debug\\TOOLS"
os.chdir(path)
os.system("doxygen Doxyconfig")

