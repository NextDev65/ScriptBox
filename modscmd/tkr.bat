@echo off
if "%*"=="" exit /b
set task=%~nx1
taskkill /F /IM "%task%" /T
:: && "%task%"
exit /b
