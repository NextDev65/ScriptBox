@echo off

set /p andip=< "%~dp0.cfg\andip.txt"
ssh %andip% -p 8022 %*

EXIT /b
