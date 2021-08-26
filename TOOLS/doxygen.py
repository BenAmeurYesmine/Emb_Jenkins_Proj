import os
import sys

jenkins_job= sys.argv[1]
os.system("doxygen Doxyconfig")

