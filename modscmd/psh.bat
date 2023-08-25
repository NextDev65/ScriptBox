@echo off

if "%*"=="" (
  :: launch shell
  powershell
) else if "%~x1"==".ps1" (
  :: execute script
  powershell -ExecutionPolicy ByPass %*
) else (
  :: run shell command
  powershell %*
)

EXIT /b
