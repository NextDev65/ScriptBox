@echo off

::https://github.com/BtbN/FFmpeg-Builds
::ffmpeg-master-latest-win64-gpl.zip

pushd "%CD%"
cd /d "%~dp0"

call a2c -x 5 "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z"
call 7zo ffmpeg-*-full_build.7z  .
cd ffmpeg-*\bin
MOVE ffmpeg.exe ..\..
MOVE ffprobe.exe ..\..
cd ..\..
for /f %%i in ('dir /a:d /b ffmpeg-*') do RD /s /q %%i

popd

EXIT /B
