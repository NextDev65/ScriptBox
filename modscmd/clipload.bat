@echo off
type %TEMP%\clipboard.tmp | clip && DEL %TEMP%\clipboard.tmp
EXIT /b
