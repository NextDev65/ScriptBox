@echo off

:: --addr 10.0.0.3:2022
rclone serve sftp %APPDATA%\rclone --user rconf --pass rconfig --addr :2022

EXIT /b
