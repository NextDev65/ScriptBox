# https://superuser.com/questions/502374/equivalent-of-linux-touch-to-create-an-empty-file-with-powershell
Function touch {
    foreach ($file in $args) {
        if ($file -eq $null) {
            throw "No filename supplied"
        }

        if (Test-Path $file) {
            (Get-ChildItem $file).LastWriteTime = Get-Date
        } else {
            New-Item $file
        }
    }
}

# https://stackoverflow.com/questions/24914589/how-to-create-permanent-powershell-aliases
Function choco-u { choco upgrade chocolatey }
Function choco-un {
    param (
        [string]$packageName
    )
    
    choco uninstall $packageName --remove-dependencies
}
Function choco-up {
    Write-Host "Listing outdated packages..."
    choco outdated

    $choice = Read-Host "Do you want to upgrade all outdated packages? (y/n)"
    if ($choice -eq 'y') {
        choco upgrade all -y
    } else {
        Write-Host "Upgrade canceled."
    }
}
