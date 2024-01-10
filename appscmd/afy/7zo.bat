@ECHO off

set output=%~2
if "%output%"=="" set output=*
7z.exe x %1 -o"%output%" && DEL %1

EXIT /b
