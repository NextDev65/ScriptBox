# go to script's dir
$CurrentDirectory = Get-Location
Set-Location -Path $PSScriptRoot

# jar
Remove-Item -Path 'apktool_*.jar'
$assetName = GetHub -Owner 'iBotPeaches' -Repo 'Apktool' -RegexPattern 'apktool_.*\.jar'
# runner bat
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat' -OutFile 'apktool.bat'

# return to current dir
Set-Location -Path $CurrentDirectory

Exit
