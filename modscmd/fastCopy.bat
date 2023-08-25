@ECHO OFF
set cdir=%CD%
set /p endir= Copy %CD% TO: 

Xcopy "%cdir%" "%endir%" /i /s /e /k /r /y
explorer "%endir%"

EXIT /B