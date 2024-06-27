#TODO
# if not installed, prompt to install
#https://learn.microsoft.com/en-us/windows/package-manager/winget/install
#https://learn.microsoft.com/en-us/windows/package-manager/winget/upgrade

# upgrade an application using winget
function Upgrade-Application {
    param (
        [string]$AppId,
        [string]$Params = @(),
        [switch]$Interactive = $false,
        [switch]$Silent = $true
    )
    
    $command = "winget upgrade --id $AppId --source winget"
    
    if ($Interactive) {
        $command += " --interactive"
    } elseif ($Silent) {
        $command += " --silent"
    }
    
    if ($Params) {
        $customParams = $Params -join " "
        $command += " --custom `"$customParams`""
    }
    
    Write-Host "Upgrading $AppId ..."
    Invoke-Expression $command
}

# PowerShell 7
$PowerShellParams = @(
    "USE_MU="
    "ENABLE_MU="
    "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL="
    "ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL="
    "ADD_PATH=1"
    "DISABLE_TELEMETRY=1"
)
#echo DOTNET_CLI_TELEMETRY_OPTOUT $env:DOTNET_CLI_TELEMETRY_OPTOUT
#echo POWERSHELL_TELEMETRY_OPTOUT $env:POWERSHELL_TELEMETRY_OPTOUT
Upgrade-Application -AppId "Microsoft.PowerShell" -Interactive -Params $PowerShellParams

# Firewall
#Upgrade-Application -AppId 'Safing.Portmaster'

# MS PowerToys
Upgrade-Application -AppId 'Microsoft.PowerToys'

# Office Suite
Upgrade-Application -AppId 'TheDocumentFoundation.LibreOffice.LTS'

# Windows Terminal
Upgrade-Application -AppId 'Microsoft.WindowsTerminal'

# Android Mirroring
Upgrade-Application -AppId 'Genymobile.scrcpy'

# Notes
Upgrade-Application -AppId 'LinwoodCloud.Butterfly'

# Focus Timer
Upgrade-Application -AppId 'YetAnotherPomodoroApp.YAPA2'
Upgrade-Application -AppId 'zxch3n.PomodoroLogger'

# Windows Tweaks
Upgrade-Application -AppId 'TeamSophia.SophiApp'
