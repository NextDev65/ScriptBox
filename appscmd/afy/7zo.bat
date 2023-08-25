@ECHO off

set output=%~2
if "%output%"=="" set output=*
call 7z x %1 -o"%output%" && DEL %1

EXIT /b
