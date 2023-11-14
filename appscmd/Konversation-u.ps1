# URL to download the zip file
# https://binary-factory.kde.org/job/Konversation_Release_win64/
$url = "https://binary-factory.kde.org/job/Konversation_Release_win64/lastSuccessfulBuild/artifact/*x86_64.exe/*zip*/Konversation-u.zip"

# Path to temporary directory
$tempDir = [System.IO.Path]::GetTempPath()

# Path to 7zo.bat
#$7zobat = "7zo.bat"

# Download the zip file
$zipPath = Join-Path $tempDir "Konversation-u.zip"
Invoke-WebRequest -Uri $url -OutFile $zipPath

# Use 7zo.bat to extract the zip file
$extractedPath = [System.IO.Path]::Combine($tempDir, "Konversation-u")
#Start-Process -FilePath $7zobat -ArgumentList "$zipPath $extractedPath" -Wait
7zo.bat $zipPath $extractedPath

# Find the executable file inside the extracted folder
$exePath = Get-ChildItem -Path $extractedPath -Filter '*x86_64.exe' | Select-Object -ExpandProperty FullName

# Run the executable
Start-Process -FilePath $exePath -Wait

# Clean up: Delete the extracted folder
Remove-Item -Path $extractedPath -Recurse -Force
