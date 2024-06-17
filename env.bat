@echo off

if /i "%processor_architecture%"=="x86" (
        start  %~dp0tools\ConEmu\ConEmu.exe
) else if /i "%processor_architecture%"=="amd64" (
    if defined processor_architew6432 (
        start  %~dp0tools\ConEmu\ConEmu.exe
    ) else (
        start  %~dp0tools\ConEmu\ConEmu64.exe
    )
)

@echo success
