& { $ProgressPreference = 'Ignore'; Import-Module -UseWindowsPowerShell Appx 3>$null }

$AppxProvisionedPackages = Get-AppxProvisionedPackage -Online
$AppxPackages = Get-AppxPackage -AllUsers
$apps = @{
    # Replace
    #'Weather'                                 = 'Microsoft.BingWeather'
    
    # Later
    'Microsoft.MixedReality.Portal'           = 'Mixed Reality Portal'
    
    # Maybe
    'Microsoft.WindowsMaps'                   = 'Maps'
    'Microsoft.YourPhone'                     = 'Phone Link'
    'microsoft.windowscommunicationsapps'     = 'Mail and Calendar'
    'Microsoft.SkypeApp'                      = 'Skype'
    'Microsoft.WindowsFeedbackHub'            = 'Feedback Hub'
    
    # Never
    'Microsoft.Microsoft3DViewer'             = '3D Viewer'
    'Microsoft.549981C3F5F10'                 = 'Cortana'
    'Microsoft.GetHelp'                       = 'Get Help'
    'Microsoft.People'                        = 'People'
    'Microsoft.MicrosoftSolitaireCollection'  = 'Solitaire Collection'
    'Microsoft.MicrosoftStickyNotes'          = 'Sticky Notes'
    'Microsoft.Getstarted'                    = 'Tips'
    #  Media
    'Microsoft.Windows.Photos'                = 'Photos'
    'Microsoft.ZuneMusic'                     = 'Windows Media Player'
    'Microsoft.ZuneVideo'                     = 'Movies & TV'
    #  Office
    'Microsoft.MicrosoftOfficeHub'            = 'Office'
    'Microsoft.Office.OneNote'                = 'OneNote'
    
    # Error
    #'Microsoft.Windows.PeopleExperienceHost'  = 'People (Taskbar)'
}

# Xbox + Gaming
#Get-AppxPackage -AllUsers | Where-Object {$_.Name -match 'Xbox|Game|Gaming'}

$appIds = ($apps.Keys -join '|')

#  Uninstall
$AppxPackages | Where-Object {$_.Name -match $appIds} | ForEach-Object {
    $appName = $apps[$_.Name];
    "Removing $appName !";
    Remove-AppxPackage $_
}

#  Unprovision (remove from future system updates)
$AppxProvisionedPackages | Where-Object {$_.DisplayName -match $appIds} | ForEach-Object {
    $appName = $apps[$_.DisplayName];
    "Unprovisioning $appName !";
    Remove-AppxProvisionedPackage -Online $_
}

Exit
