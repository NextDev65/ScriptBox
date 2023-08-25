@echo off

pushd "%CD%"
cd /d "%~dp0"

call aria2c -x 1 -o platform-tools.zip https://dl.google.com/android/repository/platform-tools-latest-windows.zip

rd /s /q platform-tools
call 7zo platform-tools.zip .

popd
EXIT /b