# Select-String instead of findstr /B(eginning of line) adds 1 newline. even when called thrice.

$CurrentDirectory = Get-Location

# go to temp directory
$tempDir = [System.IO.Path]::GetTempPath()
Set-Location -Path $tempDir

Write-Host 'Original: aria1c.exe'
$a1cZip = GetHub -Owner 'aria2'  -Repo 'aria2' -RegexPattern 'aria2-.*-win-64bit-build1.zip'
7z e $a1cZip '*\aria2c.exe' | findstr /B 'Extracting archive'
Remove-Item $a1cZip
Move-Item 'aria2c.exe' "$PSScriptRoot\aria1c.exe" -Force
Write-Host ''

Write-Host 'Mod: aria2c.exe'
$a2cZip = GetHub -Owner 'Elypha' -Repo 'aria2-mod' -FileName 'aria2c-windows-x86_64-wintls.zip'
7z e $a2cZip | findstr /B 'Extracting archive'
Remove-Item $a2cZip
Move-Item 'aria2c.exe' "$PSScriptRoot\aria2c.exe" -Force
Write-Host ''

Write-Host 'Mod + OpenSSL: aria3c.exe'
$a3cZip = GetHub -Owner 'Elypha' -Repo 'aria2-mod' -FileName 'aria2c-windows-x86_64-openssl.zip'
7z e $a3cZip | findstr /B 'Extracting archive'
Remove-Item $a3cZip
Move-Item 'aria2c.exe' "$PSScriptRoot\aria3c.exe" -Force
Move-Item 'ca-certificates.crt' "$env:USERPROFILE\.aria2\" -Force
Write-Host ''

# OpenSSL
# https://gitlab.com/q3aql/aria2-static-builds
# GUI
# https://github.com/mayswind/AriaNg

# return to current dir
Set-Location -Path $CurrentDirectory

Exit
