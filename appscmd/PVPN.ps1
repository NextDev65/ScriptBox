# this script installs, runs, and then uninstalls protonvpn

choco upgrade protonvpn -y
Start-Process 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Proton\Proton VPN.lnk' -WindowStyle Hidden -Wait
choco uninstall protonvpn

<#
$setup = GetHub -Owner 'ProtonVPN' -Repo 'win-app' -RegexPattern 'ProtonVPN_v.*\.exe'

Write-Host "Running $setup"
#PS5# (Invoke-Expression $setup) -and (Remove-Item $setup)
#PS7#
Start-Process $setup -ArgumentList "/silent" -Wait && Remove-Item $setup

winget uninstall 'Proton VPN_is1'
#>

Exit
