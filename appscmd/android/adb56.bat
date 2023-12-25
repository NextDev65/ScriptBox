@echo off

set andip=noip
::A
FOR /F "tokens=9 USEBACKQ" %%F IN (`adb shell ip route`) DO (SET andip=%%F):: && ECHO %%F)
::B
::FOR /F "tokens=2 USEBACKQ" %%F IN (`adb shell ip addr show wlan0 ^| findstr /e wlan0`) DO (SET andip=%%F):: && ECHO %%F)
::set andip=%andip:~0, -3%
::echo %andip%

::if not "x%andip:192=%"=="x%andip%" echo %andip% > "%~dp0.cfg\andip.txt"
if not "%andip%"=="noip" (echo %andip%>"%~dp0.cfg\andip.txt")
::set /p andip=<"%~dp0.cfg\andip.txt"

adb tcpip 41315
call adb connect %andip%:41315
::adb tcpip 5656
::call adb connect %andip%:5656

EXIT /b
