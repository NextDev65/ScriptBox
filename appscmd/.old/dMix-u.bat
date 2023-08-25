@echo off

pushd "%CD%"
::cd /d "%~dp0"

cd %TEMP%
call a2c "https://download.deemix.app/gui/win-x64_setup-latest.exe"
win-x64_setup-latest.exe && DEL win-x64_setup-latest.exe
DEL %USERPROFILE%\Desktop\deemix-gui.lnk

popd
EXIT /b
