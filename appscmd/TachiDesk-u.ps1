$assetName = GetHub -Owner 'Suwayomi' -Repo 'Tachidesk-Server-preview' -RegexPattern 'Tachidesk-Server-v.*-windows-x64.msi'
Write-Host "Running $assetName"
#PS5# (Invoke-Expression $assetName) -and (Remove-Item $assetName)
#PS7#
Start-Process $assetName -Wait && Remove-Item $assetName
