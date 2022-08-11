DIM objShell

set objShell=wscript.createObject("wscript.shell")

iReturn=objShell.Run("cmd.exe /C .\console.bat", 0, TRUE)