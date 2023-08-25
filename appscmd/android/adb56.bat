@echo off

set andip=noip
::A
FOR /F "tokens=9 USEBACKQ" %%F IN (`adb shell ip route`) DO (SET andip=%%F)
::FOR /F "tokens=9 USEBACKQ" %%F IN (`adb shell ip route`) DO (ECHO %%F & SET andip=%%F)
::B
::FOR /F "tokens=2 USEBACKQ" %%F IN (`adb shell ip addr show wlan0 ^| findstr /e wlan0`) DO (ECHO %%F & SET andip=%%F)
::set andip=%andip:~0, -3%
::echo %andip%

::if not "x%andip:192=%"=="x%andip%" echo %andip% > "%~dp0.cfg\andip.txt"
if not "%andip%"=="noip" echo %andip% > "%~dp0.cfg\andip.txt"
set /p andip=< "%~dp0.cfg\andip.txt"
set andip=%andip:~0, -1%

::adb tcpip 5656
::call adb connect %andip%:5656
adb tcpip 41315
call adb connect %andip%:41315
::pause