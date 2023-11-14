choco upgrade protonvpn -y
Start-Process 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Proton\Proton VPN.lnk' -WindowStyle Hidden -Wait
choco uninstall protonvpn
