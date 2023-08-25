@echo off
for %%i in (*) do (ffprobe -count_frames -threads 0 -i "%%i" >> %USERPROFILE%\Desktop\badintegrity.txt)
::start "" 
notepad.exe %USERPROFILE%\Desktop\badintegrity.txt
del %USERPROFILE%\Desktop\badintegrity.txt