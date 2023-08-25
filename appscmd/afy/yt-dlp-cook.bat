@echo off

yt-dlp --cookies-from-browser chromium:"%LOCALAPPDATA%\BraveSoftware\Brave-Browser-Beta\User Data" --cookies cookies.txt

EXIT /b
