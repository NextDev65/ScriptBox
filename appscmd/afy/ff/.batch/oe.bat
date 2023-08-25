@echo off

cd flac || EXIT /B

for /r %%a in (*.flac) do (call opusenc "%%a")
for /r %%b in (*.flac) do (if exist "%%~dpnb.opus" DEL "%%b")

cd ..
call fastMove flac Muse

:: subdirs
::for /f "usebackq delims=|" %%i in (`dir /ad /b *`) do (for /f "usebackq delims=|" %%j in (`dir /b "%%i"`) do (if exist "%%i" cd "%%i" && opusenc "%%j" && cd ..) )
:: curdir
::for %%k in (*) do (opusenc "%%k")
:: opusenc
::for %%i in ("%~dp1.") do set parent=%%~nxi
::if not exist "%~dp1..\.magnumopus\%parent%" mkdir "%~dp1..\.magnumopus\%parent%"
::"D:\Users\mhorn\Music\util\opus-tools-0.2-win64\opusenc.exe" ^
::--vbr --comp 10 --max-delay 0 --bitrate 128 %1 "%~dp1..\.magnumopus\%parent%\%~n1.opus"

::pause
EXIT /B
