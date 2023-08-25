@echo off

SET dir_letter=%CD:~0,1%
SET rel_dir=%CD:~1%\
IF "%dir_letter%"=="C" (SET endir="D%rel_dir%") ELSE (SET endir="C%rel_dir%")
IF exist %endir% (explorer %endir%)

exit /b