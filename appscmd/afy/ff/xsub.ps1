# TODO
# replace mkvmerge + mkvextract with ffmpeg
#  detect subs format

$extractDirectory = 'xSubs'
# Check if extract directory exists, if not create it
if (-not (Test-Path -Path $extractDirectory -PathType Container)) {
    New-Item -ItemType Directory -Name $extractDirectory | Out-Null
}

# Check if arguments are provided
if ($args.Count -eq 0) {
    # No arguments provided, dump from all video files in the current directory
    $videoFiles = Get-ChildItem .\* -Include *.mkv, *.mp4
} else {
    # Arguments provided, dump from specified videos
    $videoFiles = $args | ForEach-Object { Get-Item -Path $_ }
}

# Loop through each MKV file and extract subtitle tracks
foreach ($videoFile in $videoFiles) {
    # Construct the output folder path for extracted subtitles
    $outputFolder = Join-Path $extractDirectory $videoFile.Name
    
    # Create the output folder if it doesn't exist
    if (-not (Test-Path -Path $outputFolder -PathType Container)) {
        New-Item -ItemType Directory -Path $outputFolder | Out-Null
    }
    
    # Use mkvinfo to get information about the MKV file
    $mkvMergeOutput = & mkvmerge.exe -i $videoFile.FullName | Select-String -Pattern '^Track ID (.*): subtitles \((.*)\)$'
    $subsMatches = $mkvMergeOutput.Matches
    
    # Use mkvextract to extract all subtitle tracks
    foreach ($subsMatch in $subsMatches) {
        $trackID = $subsMatch.Groups[1].Value
        $trackFormat = $subsMatch.Groups[2].Value
        $outputFile = Join-Path $outputFolder "$($videoFile.BaseName)_$trackID.ass"
        & mkvextract.exe tracks $videoFile.FullName "$trackID`:$outputFile"
        #Write-Host "& mkvextract.exe tracks $($videoFile.FullName) `"$trackID`:$outputFile`""
    }
    
    # mkvextract is verbose enough
    #Write-Host "Subtitles extracted from $($videoFile.Name) and saved to $outputFolder\"
}

Exit
