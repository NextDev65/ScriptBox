@echo off
set audfile=%1
ffprobe.exe -i %audfile% -show_entries stream=channels,channel_layout -select_streams a:0 -of compact=p=0:nk=1 -v 0 > channel.txt
::start "" 
notepad.exe channel.txt
del channel.txt
