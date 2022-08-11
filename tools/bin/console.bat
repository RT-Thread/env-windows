@echo off

SET RTT_EXEC_PATH=%~dp0\tools\gnu_gcc\arm_gcc\mingw\bin
SET RTT_CC=gcc
SET SCONS=%~dp0\tools\Python27\Scripts

SET PKGS_ROOT=%~dp0\packages
SET ENV_ROOT=%~dp0

set PATH=%~dp0\tools\Python27;%PATH%
set PATH=%~dp0\tools\Python27\Scripts;%PATH%
set PATH=%~dp0\tools\bin;%PATH%
set PATH=%RTT_EXEC_PATH%;%PATH%
set PATH=%~dp0\tools\qemu;%PATH%
set PYTHONPATH=%~dp0\tools\Python27;

start ..\console\Console.exe -r "/k chcp 437" 

@echo success
