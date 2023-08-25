@echo off

if not "%2"=="" set source=%~f1&& set dest=%~f2&& goto OP

set /p dest= Move %CD% TO: 
set source=%CD%

:OP
pushd ..
robocopy "%source%" "%dest%" /s /e /move /MT[:10] /sl /xj /xjd /xjf /r:5 /w:1 /nfl /ndl /log:NUL /njh /njs > NUL
::explorer "%dest%"
popd
EXIT /B
