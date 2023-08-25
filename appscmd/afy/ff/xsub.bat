@echo off

set inpvid=%~nx1

:: get sub ext
::call lput "ffprobe.exe -i "%inpvid%" 2>&1 | grep Subtitle: | cut -d: -f4 | cut -d' ' -f2" && set /p codec=<linput.txt && del linput.txt
::ffmpeg -i "%inpvid%" -map 0:s:2 "%~n1.%codec%"
::ffmpeg -i "%inpvid%" -map 0:s -c copy "%~n1.%codec%

:: https://www.reddit.com/r/ffmpeg/comments/qtrdwi/comment/hkli79u
:: Convert first text-based (e.g. ASS) subtitle stream to SRT
::ffmpeg -i "%inpvid%" -map 0:s:0 -c:s srt output.srt
:: Convert first bitmap-based (e.g. PGS) subtitle stream to VobSub
::ffmpeg -i "%inpvid%" -map 0:s:0 -c:s dvdsub output.sup

:: manually pass sub ext as 2nd arg
IF "%2"=="ass" (ffmpeg -i "%inpvid%" "%~n1.ass")
IF "%2"=="srt" (ffmpeg -i "%inpvid%" "%~n1.srt")
IF "%2"=="vob" (ffmpeg -i "%inpvid%" "%~n1.vob")

EXIT /b
