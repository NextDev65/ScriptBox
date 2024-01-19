# dump + overwrite attachments (fonts) to $extractDirectory

$extractDirectory = 'xFonts'
# Check if extract directory exists, if not create it
if (-not (Test-Path -Path $extractDirectory -PathType Container)) {
    New-Item -ItemType Directory -Name $extractDirectory
}

# Check if arguments are provided
if ($args.Count -eq 0) {
    # No arguments provided, dump from all video files in the current directory
    $videoFiles = Get-ChildItem .\* -Include *.mkv, *.mp4
} else {
    # Arguments provided, dump from specified videos
    $videoFiles = $args | ForEach-Object { Get-Item -Path $_ }
}

Set-Location -Path $extractDirectory

# Loop through selected video files
foreach ($videoFile in $videoFiles) {
    # Dump attachments of each video to the current directory
    ffmpeg -dump_attachment:t '' -i $($videoFile.FullName) -y
}

Set-Location -Path '..'

Exit
