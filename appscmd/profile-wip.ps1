# https://stackoverflow.com/questions/24914589/how-to-create-permanent-powershell-aliases
Function choco-u { choco upgrade chocolatey }
Function choco-un {
    param (
        [string]$packageName
    )
    
    choco uninstall $packageName --remove-dependencies
}
