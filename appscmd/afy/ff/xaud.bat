@echo off

set inpvid=%~nx1

:: get codec
call lput "ffprobe.exe -i "%inpvid%" 2>&1 | grep Audio: | cut -d' ' -f6 | cut -d, -f1" && set /p codec=<linput.txt && del linput.txt

:: extract audio
ffmpeg-q -i "%inpvid%" -vn -acodec copy "%~n1.%codec%"

:: display codec
echo %codec%
pause

EXIT /b