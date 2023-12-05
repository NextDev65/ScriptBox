@echo off

set gh_source="https://api.github.com/repos/Suwayomi/Tachidesk-Server/releases/latest"
set asset_match="browser_download_url.*Tachidesk-.*-windows-x64.msi"

::call gethub %gh_source% %asset_match%
set line="curl -s %gh_source% | findstr %asset_match%"

FOR /F "tokens=* USEBACKQ" %%F IN (`%line%`) DO (SET asset=%%F)

set asset=%asset: =%
set asset=%asset:"=%
set asset=%asset:browser_download_url:=%

call a2c -x 10 "%asset%" -o "Tachidesk.msi" && Tachidesk.msi && del Tachidesk.msi

EXIT /b
