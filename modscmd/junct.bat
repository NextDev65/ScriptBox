@echo off
set /p endir=Junction at '%CD%' from: 
if "%endir%"=="" set endir=%CD% && echo ":%CD%"
set endir=C:\%endir:~3%
set cdir=%CD%
mklink /j "%endir%" "%cdir%"
explorer "%endir%"
::pause
exit /b