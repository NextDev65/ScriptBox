@echo off
set gh_source="https://api.github.com/repos/dege-diosg/dgVoodoo2/releases/latest"
set asset_match="browser_download_url.*dgVoodoo2.*[^dbg]\.zip"
call gethub %gh_source% %asset_match%
ren dgVoodoo .dgVoodoo-o
call 7zo dgVoodoo*.zip dgVoodoo
move /y .dgVoodoo-o\dgVoodoo.conf dgVoodoo\dgVoodoo.conf
pause
rd /q /s .dgVoodoo-o
del dgVoodoo*.zip