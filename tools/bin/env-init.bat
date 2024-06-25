@echo off
:: Do not repeat run
if not "%ENV_ROOT%" == "" goto end

:: not ConEmu
if "%ConEmuBaseDir%" == "" goto env

:: Creat user CmdInit.cmd
if not exist "%USERPROFILE%\.conemu\CmdInit.cmd" (
    if not exist "%USERPROFILE%\.conemu" (
        mkdir "%USERPROFILE%\.conemu"
    )
    (
        echo rem !!! Sample user specific settings that will persist in upgrade !!!
        echo rem !!! Save as "%%USERPROFILE%%\.conemu\CmdInit.cmd" to activate    !!!
        echo.
        echo rem echo Loading ConEmu user settings...
        echo.
        echo rem Loading RT-Thread Env
        echo if exist "%%ConEmuBaseDir%%\..\..\..\env.bat" (
        echo    if exist "%%ConEmuBaseDir%%\..\..\bin\env-init.bat" (
        echo        call "%%ConEmuBaseDir%%\..\..\bin\env-init.bat"
        echo    ^)
        echo ^)
    ) > "%USERPROFILE%\.conemu\CmdInit.cmd"
    echo Create user profile additions success: "%USERPROFILE%\.conemu\CmdInit.cmd"
)

:env
:: ============= Add ENV Tools Path =============
set ENV_ROOT=%~dp0..\..
@REM set PYTHONPATH=%ENV_ROOT%\tools\Python27
@REM set PYTHONHOME=%ENV_ROOT%\tools\Python27
set RTT_EXEC_PATH=%ENV_ROOT%\tools\gnu_gcc\arm_gcc\mingw\bin
set RTT_CC=gcc
set PKGS_ROOT=%ENV_ROOT%\packages
@REM set SCONS=%PYTHONPATH%\Scripts
:: Add to %PATH%
call :AddPath "%ENV_ROOT%\tools\git-2.41.0-32-bit\cmd"
call :AddPath "%ENV_ROOT%\tools\bin"
call :AddPath "%RTT_EXEC_PATH%"
@REM call :AddPath "%PYTHONHOME%"
@REM call :AddPath "%PYTHONPATH%"
@REM call :AddPath "%SCONS%"
call :AddPath "%ENV_ROOT%\tools\qemu\qemu64"

:: ============= Change Code Page =============

chcp 65001 > nul
@REM python %~dp0..\scripts\env.py -v
echo RT-Thread Env Tool (ConEmu) Version 1.5.2
echo  ^\ ^| /
echo - RT -     Thread Operating System
echo  / ^| ^\
echo 2006 - 2024 Copyright by RT-Thread team


Setlocal ENABLEDELAYEDEXPANSION
:: 启用命令扩展，参加setlocal /?命令
set str1=%~dp0
set str=%str1%
set env_root=%~dp0

:next
if not "%str%"=="" (
set /a num+=1
if "!str:~0,1!"==" " (
    echo.
    echo *******************************************************************
    echo Env 工具所在路径如下：
    echo %env_root:~0,-21%
    echo 警告：以上路径不能包含中文或空格，请将 Env 移动到符合要求的路径中。
    echo *******************************************************************
    endlocal
    goto break_str
)
set "str=%str:~1%"
goto next
)
endlocal

set "str=%~dp0"
>"%tmp%\t.t" echo;WSH.Echo(/[\u4E00-\u9FFF]/.test(WSH.Arguments(0)))
for /f %%a in ('cscript -nologo -e:jscript "%tmp%\t.t" "%str%"') do if %%a neq 0 (goto not_support_chinese) else goto break_str

:not_support_chinese
echo.
echo *******************************************************************
echo Env 工具所在路径如下：
echo %env_root:~0,-29%
echo 警告：以上路径不能包含中文或空格，请将 Env 移动到符合要求的路径中。
echo *******************************************************************

:break_str
set str=
chcp 437 > nul


:: ============= Activate or Create Python VENV =============
set RTT_ENV_URL=%~dp0..\scripts
set VENV=%ENV_ROOT%\.venv
set PYTHON=%ENV_ROOT%\tools\python-3.11.9-amd64\python.exe
echo.
if not exist %VENV% (
    echo Create Python venv for RT-Thread
    %PYTHON% -m pip uninstall pip -y
    %PYTHON% -m ensurepip
    %PYTHON% -m venv %VENV%
    echo Activate Python VENV in %VENV%
    call %VENV%\Scripts\activate.bat
    echo Install RT-Thread ENV from %RTT_ENV_URL%
    pip install %RTT_ENV_URL%
) else (
    echo Activate Python VENV in %VENV%
    call %VENV%\Scripts\activate.bat
)

goto end
:: ======================================================

:: 不重复添加路径到 %PATH% 中
:AddPath
setlocal enabledelayedexpansion
set "new_path=%~1"

:: 将相对路径转换为绝对路径
for %%A in ("%new_path%") do set "new_path=%%~fA"

:: 检查 %PATH% 是否已经包含了要添加的路径
echo %PATH% | findstr /i /c:"%new_path%;" >nul
if errorlevel 1 (
    set "PATH=%new_path%;%PATH%"
) else (
    :: 如果已经包含则将路径移动到 %PATH% 的最前面
    set "PATH=!new_path!;!PATH:%new_path%;=!"
)

endlocal & set "PATH=%PATH%"
goto:eof

:end
if "%ConEmuBaseDir%" == "" (
    %ENV_ROOT%\tools\ConEmu\ConEmu\clink\clink.bat inject
)
