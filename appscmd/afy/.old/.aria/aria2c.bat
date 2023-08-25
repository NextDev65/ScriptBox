@echo off
:: https://github.com/aria2/aria2/issues/1039#issuecomment-857658684
aria2cc.exe --conf-path="%USERPROFILE%\.aria2\aria2.conf" %*
exit /b
