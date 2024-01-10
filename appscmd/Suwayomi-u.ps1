$assetName = GetHub -Owner 'Suwayomi' -Repo 'Suwayomi-Server-preview' -RegexPattern 'Suwayomi-Server-v.*-windows-x64.msi'
Write-Host "Running $assetName"
#PS5# (Invoke-Expression $assetName) -and (Remove-Item $assetName)
#PS7#
Start-Process $assetName -Wait && Remove-Item $assetName
