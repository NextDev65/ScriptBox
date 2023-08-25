@echo off
setlocal enabledelayedexpansion
set flags=%*
set flags=!flags:%1=!
@echo on
call adb %flags% shell input text '"%1"'
@echo off
setlocal disabledelayedexpansion
