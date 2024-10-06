@echo off
setlocal enabledelayedexpansion

set "skip=0"
for /f "delims=" %%a in ('tree "%~1" /F') do (
    if !skip! lss 2 (
        set /a skip+=1
    ) else (
        echo.%%a
    )
)

endlocal
EXIT /b
