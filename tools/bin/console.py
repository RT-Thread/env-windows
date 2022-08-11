import os
import sys

path = os.environ["PATH"]
#print "now:",path  

path = os.getcwd()+ "/tools/git/Git/bin" + ';' + os.getcwd()+ "/tools/bin" + ';'+ os.getcwd() + "/tools/Python27"+ ';' + os.getcwd() + "/tools/Python27/Scripts"+';'+ os.getcwd() + "/tools/qemu" +';' + os.getcwd()+ "/tools/qemu/qemu32" + ';' + os.environ["PATH"]

os.environ["PATH"] = path

os.environ["ENV_ROOT"] = os.getcwd()
os.environ["PKGS_ROOT"] = os.getcwd() + "/packages"
os.environ["RTT_EXEC_PATH"] = os.getcwd() + "/tools/gnu_gcc/arm_gcc/mingw/bin"
os.environ["RTT_CC"] = "gcc"
os.environ["SCONS"] = os.getcwd() + "/tools/Python27/Scripts"

#print "after:",os.environ["PATH"]

#os.system('start tools/console/Console.exe -r "/k chcp 437"')

os.system('start tools\\console\\Console.exe -r "/k chcp 437"')