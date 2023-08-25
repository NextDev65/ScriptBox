@echo off
setlocal enabledelayedexpansion
set flags=%*
set flags=!flags:%1=!
set flags=!flags:%2=!
@echo on
echo call adb %flags% push %1 --sync "%2"
@echo off
setlocal disabledelayedexpansion