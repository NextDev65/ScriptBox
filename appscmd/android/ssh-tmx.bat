@echo off
set /p andip=< "%~dp0.cfg\andip.txt"
ssh %andip% -p8022