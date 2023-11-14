$assetName = GetHub -Owner 'LizardByte' -Repo 'Sunshine' -FileName 'sunshine-windows-installer.exe'
Write-Host "Running $assetName"
#PS5# (Invoke-Expression $assetName) -and (Remove-Item $assetName)
#PS7#
Start-Process $assetName -Wait && Remove-Item $assetName
