@echo off

:: TODO : DEL old jar

pushd "%CD%"
cd /d "%~dp0"

set gh_source="https://api.github.com/repos/iBotPeaches/Apktool/releases/latest"
set asset_match="browser_download_url.*apktool.*jar"
gethub %gh_source% %asset_match%
aria2c "https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat"
::pause

popd

EXIT /b
