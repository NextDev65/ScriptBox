@echo off
pushd "%CD%"
cd /d "%~dp0"

set gh_source="https://api.github.com/repos/jbruchon/jdupes/releases/latest"
set asset_match="browser_download_url.*jdupes-.*-win64\.zip"

call gethub %gh_source% %asset_match%
call 7zo jdupes-*-win64.zip jdupes-u
cd jdupes-u && cd jdupes-* && MOVE /y jdupes.exe ..\..\jdupes.exe && cd ..\.. && RD /s /q jdupes-u

popd
EXIT /b
