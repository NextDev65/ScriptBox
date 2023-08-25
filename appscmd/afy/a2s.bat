@echo off

::aria2c.exe --max-tries 0 --retry-wait 180 --max-connection-per-server 1 %*
aria2c.exe --max-tries 0 --retry-wait 180 --split 1 %*

EXIT /b
