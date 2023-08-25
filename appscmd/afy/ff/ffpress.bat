@echo off
:: TEST :: sh is broken!
wsl ffpress.sh %1 %2
::DEL ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree
EXIT /b