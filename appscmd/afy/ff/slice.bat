@echo off

::if "%1"=="" goto :EOF
set fname=%~n1
set fext=%~x1

set start=%2
if "%start%"=="" set /p start=start? 
if "%start%"=="" set start=00:00:00
if "%start::=%"=="%start%" set start=00:00:%start%

set end=%3
if "%end%"=="" set /p end=end?   
if "%end%"=="" call lput "ffprobe.exe -v quiet -i "%fname%%fext%" -show_entries format=duration -sexagesimal | grep duration= | cut -d= -f2" && set /p end=<linput.txt && del linput.txt
if "%end::=%"=="%end%" set end=00:00:%end%

set name=%4
if "%name%"=="" set /p name=name?  
if "%name%"=="" set name=x %fname%
set name=%name%%fext%

:: accurate start, and no autodetect original codec (only mp4)
:: https://superuser.com/questions/458761/accurately-cut-video-files-from-command-line
::call ffmpeg -ss %start% -i "%fname%%fext%" -to %end% -c:v libx264 -c:a copy "%name%"

call ffmpeg-q -i "%fname%%fext%" -ss %start% -to %end% -c copy "%name%"
:: >60 cuts to end of original, <60 end cut is inaccurate
::call ffmpeg-q -ss %start% -i "%fname%%fext%" -to %end% -c:v copy -c:a copy "%name%"
::call ffmpeg-q -ss %start% -to %end% -i "%fname%%fext%" -c:v copy -c:a copy "%name%"

EXIT /b
