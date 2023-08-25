@echo off
powershell -command "Get-Clipboard > %TEMP%\clipboard.tmp"
EXIT /b
