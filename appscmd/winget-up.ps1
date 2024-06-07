#TODO
# make upgrade function
#  exact id match `--exact`
#https://learn.microsoft.com/en-us/windows/package-manager/winget/install

# PowerShell 7
$Params = @(
    "USE_MU=0"
    "ENABLE_MU=0"
    "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=0"
    "ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=0"
    "ADD_PATH=1"
    "DISABLE_TELEMETRY=1"
)
winget upgrade --interactive --id Microsoft.PowerShell --source winget --custom ($Params -join " ")
#winget upgrade --silent --id Microsoft.PowerShell --source winget --custom ($Params -join " ")
#echo DOTNET_CLI_TELEMETRY_OPTOUT $env:DOTNET_CLI_TELEMETRY_OPTOUT
#echo POWERSHELL_TELEMETRY_OPTOUT $env:POWERSHELL_TELEMETRY_OPTOUT

# Firewall
#winget upgrade --silent --id Safing.Portmaster --source winget

# MS PowerToys
winget upgrade --silent --id Microsoft.PowerToys --source winget

# Windows Terminal
winget upgrade --silent --id Microsoft.WindowsTerminal --source winget

# Android Mirroring
winget upgrade --silent --id Genymobile.scrcpy --source winget

# Notes
winget upgrade --silent --id LinwoodCloud.Butterfly --source winget

# Focus Timer
winget upgrade --silent --id YetAnotherPomodoroApp.YAPA2 --source winget
winget upgrade --silent --id zxch3n.PomodoroLogger --source winget

# Windows Tweaks
winget upgrade --silent --id TeamSophia.SophiApp --source winget
