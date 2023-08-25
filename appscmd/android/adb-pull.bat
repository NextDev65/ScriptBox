@echo off
setlocal enabledelayedexpansion
set flags=%*
set flags=!flags:%1=!
@echo on
call adb %flags% pull "%1"
@echo off
setlocal disabledelayedexpansion