@echo off

set fname=%~n1
set fext=%~x1

:: embedded thumbnail is lost :(
ffmpeg -i "%fname%%fext%" -filter:a "volume=%2" -vcodec copy "%fname% %2%fext%"

EXIT /B
