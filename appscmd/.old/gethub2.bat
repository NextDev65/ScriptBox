
:: if %2 is double quoted in parent, make it quadruple quoted ?!
:: or can \escape the spaces? (it's a findstr thing, i think)
::set line="curl -s https://www.fosshub.com/MKVToolNix.html | findstr """"https://www.fosshub.com/MKVToolNix.html?dwl=mkvtoolnix-64-bit-*.7z"""""
::? gethub2 https://www.fosshub.com/MKVToolNix.html """"https://www.fosshub.com/MKVToolNix.html?dwl=mkvtoolnix-64-bit-*.7z""""

set line="curl -s %1 | findstr /R %2"

FOR /f delims^=^"^ tokens^=2^ USEBACKQ %%F IN (`%line%`) DO (SET "asset=%%F")

set asset=%asset: =%
set asset=%asset:"=%
set asset=%asset:browser_download_url:=%
::call
aria2c --continue=true -x 10 "%asset%"
::curl -L -O %asset% -C -

::EXIT /b
