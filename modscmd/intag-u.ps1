# go to script's dir
$CurrentDirectory = Get-Location
Set-Location -Path $PSScriptRoot

#intag.exe -uninstall
Remove-Item intag.exe

GetHub.ps1 -Owner 'Jamminroot' -Repo 'intag' -FileName 'intag.zip'
7z e intag.zip && Remove-Item intag.zip

intag.exe

# return to current dir
Set-Location -Path $CurrentDirectory
Exit
