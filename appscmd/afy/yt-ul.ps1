# yt-ul.ps1
<#
TODO
    chapters: prepend timestamp to description lines
#>

param (
    [String]$Merged
)

function UploadToYouTube([String]$filename, [String]$description = '') {
    # Upload the file to YouTube using youtube-uploader
    youtubeuploader -filename $filename -secrets (Get-Item .\client_secret*.json).Name -description $description
    
    # Delete the file after uploading successfully
    If ($?) { Remove-Item -LiteralPath $filename }
    Else {
        if ($description) {$description | Out-File description.txt}
        Read-Host -Prompt "Press Enter to exit"
    }
}

# Get a sorted list (Date Created, Ascending) of .mp4 files in the current directory
$mp4 = Get-ChildItem -Filter *.mp4 | Sort-Object CreationTime

If ($Merged) {    
    # Build description with timestamps and filenames
    #$Description = $($mp4.BaseName -join "\n")
    # Initialize the current time
    $totalDuration = 0
    # Initialize the description string
    $Description = ''
    # Loop through each video file
    $mp4 | ForEach-Object {
        # Get the video duration using ffmpeg
        $videoDuration = ffmpeg -i $_.FullName 2>&1 | Select-String "Duration"
        $durationPattern = 'Duration: (\d+):(\d+):(\d+\.\d+),'
        $null = $videoDuration -match $durationPattern
        # PS7 #$videoDuration -match $durationPattern | Out-Null
        $hours = [int]$matches[1]
        $minutes = [int]$matches[2]
        $seconds = [double]$matches[3]
        
        # Calculate the total duration in seconds
        $totalSeconds = ($hours * 3600) + ($minutes * 60) + $seconds
        
        # Format the timestamp
        if ($hours -eq 0) {
            $timestamp = [TimeSpan]::FromSeconds($totalDuration).ToString("mm\:ss")
        } else {
            $timestamp = [TimeSpan]::FromSeconds($totalDuration).ToString("hh\:mm\:ss")
        }
        
        # Append the formatted timestamp and base name of the video to the description
        $Description += "$timestamp $($_.BaseName)\n"
        
        # Update the total duration
        $totalDuration += $totalSeconds
    }
    # Merge all .mp4 files in the current directory (oldest first)
    $mp4list = $mp4 | Resolve-Path -Relative
    $OutputFileName = merge @mp4list -BaseName $Merged
    #Exit
    
    # UploadToYouTube
    UploadToYouTube $OutputFileName $Description
}
Else {
    # Upload individual .mp4 files
    $mp4 | ForEach-Object {
        $filename = $_.Name
        UploadToYouTube $filename
    }
}

Exit
