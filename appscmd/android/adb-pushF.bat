@echo off
setlocal enabledelayedexpansion
set flags=%*
set flags=!flags:%1=!
@echo on
call adb %flags% push %1 --sync "/sdcard/Files/"
call adb %flags% push %1 --sync "/mnt/sdcard/Files/"
@echo off
setlocal disabledelayedexpansion