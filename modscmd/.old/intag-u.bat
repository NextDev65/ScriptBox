@echo off
pushd "%CD%"
cd /d "%~dp0"

set gh_source="https://api.github.com/repos/Jamminroot/intag/releases/latest"
set asset_match="browser_download_url.*intag\.zip"

::intag -uninstall
DEL intag.exe

call gethub %gh_source% %asset_match%
call 7zo intag.zip .

intag.exe

popd
EXIT /b
