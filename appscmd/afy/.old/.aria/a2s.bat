@echo off

::a2c.bat --max-tries 0 --retry-wait 180 --max-connection-per-server 1 %*
a2c.bat --max-tries 0 --retry-wait 180 --split 1 %*

EXIT /b
