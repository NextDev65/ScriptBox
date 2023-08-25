@echo off

set line="curl -s ""https://megatools.megous.com/builds/builds/"" | findstr ""megatools-.*win64\.zip"""
FOR /F "tokens=2 delims=>< USEBACKQ" %%F IN (`%line%`) DO (SET asset=%%F)
call a2c -x 1 "https://megatools.megous.com/builds/builds/%asset%"
:: extract only exe
::call 7z x megatools*.zip megatools*\megatools.exe
call 7zo megatools*.zip megatools-temp && rd /s /q megatools
move megatools-temp\megatools* megatools && rd /s /q megatools-temp
DEL megatools\CHECKSUMS.TXT megatools\DEPS.TXT megatools\LICENSE.TXT megatools\TODO.TXT

EXIT /b
