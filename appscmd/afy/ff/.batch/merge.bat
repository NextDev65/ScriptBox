@echo off

::set fextA=%~x1
::set fnameA=%~n1
::set fnameB=%~n2

::s should work for >2 files, but outfile will still be "fnameA, fnameB.fextA"
for %%i in (%*) do (echo file '%%~i'>> mergein.txt)
ffmpeg -safe 0 -f concat -i mergein.txt -c copy "%~n1, %~n2%~x1"
DEL mergein.txt

EXIT /b
