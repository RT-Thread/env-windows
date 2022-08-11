:: use this file to run your own startup commands
:: use  in front of the command to prevent printing the command

:: uncomment this to have the ssh agent load when cmder starts
:: call "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd"

:: uncomment this next two lines to use pageant as the ssh authentication agent
:: SET SSH_AUTH_SOCK=/tmp/.ssh-pageant-auth-sock
:: call "%GIT_INSTALL_ROOT%/cmd/start-ssh-pageant.cmd"

:: you can add your plugins to the cmder path like so
:: set "PATH=%CMDER_ROOT%\vendor\whatever;%PATH%"

:: 1. copy this file to cmder_mini/config/
:: 2. change your ENV path to ENV_ROOT;
:: 3. add cmder_mini folder to windows PATH;
:: 4. execute 'Cmder.exe /REGISTER ALL' on windows command line by administrator permission;

set ENV_ROOT=E:\program\RTT\env_released_0.6.3\env
set RTT_EXEC_PATH=%ENV_ROOT%\tools\gnu_gcc\arm_gcc\mingw\bin
set RTT_CC=gcc
set SCONS=%ENV_ROOT%\tools\Python27\Scripts
set PKGS_ROOT=%ENV_ROOT%\packages
set PATH=%ENV_ROOT%\tools\git\Git\bin;%PATH%
set PATH=%ENV_ROOT%\tools\Python27;%PATH%
set PATH=%ENV_ROOT%\tools\Python27\Scripts;%PATH%
set PATH=%ENV_ROOT%\tools\bin;%PATH%
set PATH=%RTT_EXEC_PATH%;%PATH%
set PATH=%ENV_ROOT%\tools\qemu\qemu32;%PATH%
set PYTHONPATH=%ENV_ROOT%\tools\Python27;
chcp 437
