@echo off

set inpvid=%~nx1

mkdir xfonts && cd xfonts

ffmpeg -dump_attachment:t "" -i "..\%inpvid%"

cd ..

EXIT /b
