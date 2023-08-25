@echo off

call lput "for file in *.mkv; do mkvpropedit.exe "$file" --edit info --set "title=${file%%%%.*}"; done" && del linput.txt
