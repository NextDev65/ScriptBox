set line="curl -s %1 | findstr /R %2"

FOR /F "tokens=* USEBACKQ" %%F IN (`%line%`) DO (SET asset=%%F)

set asset=%asset: =%
set asset=%asset:"=%
set asset=%asset:browser_download_url:=%

aria2c --no-conf --continue=true -x 10 "%asset%"
::curl --location --remote-name %asset% --continue-at -
::curl -L -O %asset% -C -
::EXIT /b
