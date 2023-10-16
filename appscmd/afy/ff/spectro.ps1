# Get a list of all FLAC files in the current directory
$flacFiles = Get-ChildItem -Filter "*.flac"

# Loop through each FLAC file and generate a spectrogram
foreach ($file in $flacFiles) {
    $inputFile = $file.FullName
    $outputFile = Join-Path -Path $file.DirectoryName -ChildPath "$($file.BaseName).png"

    # Execute the ffmpeg command to generate the spectrogram
    $command = "ffmpeg -i '$inputFile' -lavfi showspectrumpic=s=1920x960:mode=separate '$outputFile'"
    Invoke-Expression $command

    Write-Host "Generated spectrogram for $($file.Name) and saved as $($file.BaseName).png"
}

Write-Host "Spectrograms generated for all FLAC files in the current directory."

Exit
