$Params = @(
    "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=0"
    "ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=0"
    "ADD_PATH=1"
    "DISABLE_TELEMETRY=1"
)
winget upgrade --id Microsoft.PowerShell --source winget --custom ($Params -join " ")
echo DOTNET_CLI_TELEMETRY_OPTOUT $env:DOTNET_CLI_TELEMETRY_OPTOUT
echo POWERSHELL_TELEMETRY_OPTOUT $env:POWERSHELL_TELEMETRY_OPTOUT

winget upgrade --id Microsoft.WindowsTerminal --source winget


winget upgrade --id YetAnotherPomodoroApp.YAPA2 --source winget
winget upgrade --id zxch3n.PomodoroLogger --source winget
