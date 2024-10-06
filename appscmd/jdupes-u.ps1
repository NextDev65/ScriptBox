# Delete old exe
Remove-Item -Path 'jdupes.exe'

# pull releases page
$response = Invoke-WebRequest -Uri 'https://codeberg.org/jbruchon/jdupes/releases'

# Parse for latest release URL
$downloadUrl = $response.Links | Where-Object { $_.href -like 'https://codeberg.org/jbruchon/jdupes/releases/download/*/jdupes-*-win64.zip' } | Select-Object -First 1 -ExpandProperty href

# Extract file name from URL
$fileName = $downloadUrl.Split("/")[-1]

# Define destination path
$destination = $fileName
#$destination = Join-Path -Path $env:TEMP -ChildPath $fileName

# Download zip
Invoke-WebRequest -Uri $downloadUrl -OutFile $destination
#Write-Output "File downloaded to: $destination"

# Extract new exe
7z e $destination '*\jdupes.exe' | findstr /B 'Extracting archive'

# Delete zip
Remove-Item -Path $destination
