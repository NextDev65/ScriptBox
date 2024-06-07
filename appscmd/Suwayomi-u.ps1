# go to temp dir
$CurrentDirectory = Get-Location
$tempDir = [System.IO.Path]::GetTempPath()
Set-Location -Path $tempDir

# GetHub
$assetName = GetHub -Owner 'Suwayomi' -Repo 'Suwayomi-Server-preview' -RegexPattern 'Suwayomi-Server-v.*-windows-x64.msi'

# uninstall old
Write-Host "Removing old version"
winget uninstall 'Suwayomi Server'

Write-Host "Running $assetName"
#PS5# (Invoke-Expression $assetName) -and (Remove-Item $assetName)
#PS7#
Start-Process $assetName -Wait && Remove-Item $assetName

# return to current dir
Set-Location -Path $CurrentDirectory

# remove app shortcuts
$DesktopPath = [Environment]::GetFolderPath("Desktop")
Remove-Item "$DesktopPath\Suwayomi Launcher.lnk"
$AppDataPath = [Environment]::GetFolderPath("ApplicationData")
Remove-Item -Recurse "$AppDataPath\Microsoft\Windows\Start Menu\Programs\Suwayomi-Server"
