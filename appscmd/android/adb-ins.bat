@echo off
setlocal enabledelayedexpansion
set flags=%*
set flags=!flags:%1=!
::@echo on
call adb %flags% install --fastdeploy %1
:: --bypass-low-target-sdk-block %1
::@echo off
setlocal disabledelayedexpansion