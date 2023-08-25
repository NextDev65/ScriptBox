@echo off

call yt-dlp-cook
aria2c.exe --load-cookies cookies.txt %*

EXIT /b
