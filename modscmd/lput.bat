@echo off
setlocal ENABLEDELAYEDEXPANSION

set command=%*
if "!command!"=="" exit /b
wsl !command:~1,-1! > linput.txt

exit /b