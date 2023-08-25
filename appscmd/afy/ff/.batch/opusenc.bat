@echo off

"D:%HOMEPATH%\Music\util\opus-tools-0.2-win64\opusenc.exe" ^
--vbr --comp 10 --max-delay 0 --bitrate 128 %1 "%~dpn1.opus"

::pause
exit /b
