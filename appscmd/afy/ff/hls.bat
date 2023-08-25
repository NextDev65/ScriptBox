@echo off

set name="%2"
if "%name%"=="" set name=hls.mkv

::protocol_whitelist file,http,https,tcp,tls,crypto
ffmpeg -protocol_whitelist file,http,https,tcp,tls -i "%1" -codec copy "%name%"
