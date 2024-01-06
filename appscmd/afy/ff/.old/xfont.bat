@echo off

set inpvid=%~nx1

echo.%inpvid%
IF NOT EXIST "%inpvid%.fonts" (mkdir "%inpvid%.fonts")
cd "%inpvid%.fonts"

ffmpeg -dump_attachment:t "" -i "..\%inpvid%"

cd ..

EXIT /b
