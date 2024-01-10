# go to script's dir
$CurrentDirectory = Get-Location
Set-Location -Path $PSScriptRoot

GetHub -Owner 'derrod' -Repo 'legendary' -FileName 'legendary.exe'

# return to current dir
Set-Location -Path $CurrentDirectory

Exit
