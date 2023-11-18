# this script installs, runs, then uninstalls protonvpn
# choco protonvpn is broken: 3.2.4 is outdated but also not available from source (github)

<#
choco upgrade protonvpn -y
Start-Process 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Proton\Proton VPN.lnk' -WindowStyle Hidden -Wait
choco uninstall protonvpn
#>

$setup = GetHub -Owner 'ProtonVPN' -Repo 'win-app' -RegexPattern 'ProtonVPN_v.*\.exe'
$tempDir = [System.IO.Path]::GetTempPath()
Move-Item $setup $tempDir
$setupPath = Join-Path $tempDir $setup
Start-Process $setupPath -ArgumentList "/silent" -Wait
Remove-Item $setupPath
winget uninstall 'Proton VPN_is1'
