# Get the input video file name
$inputVideo = (Get-Item $args[0]).BaseName

# Create a directory for fonts if it doesn't exist
$fontsDirectory = "$inputVideo.fonts"
if (-not (Test-Path -Path $fontsDirectory -PathType Container)) {
    New-Item -Path $fontsDirectory -ItemType Directory | Out-Null
}

Set-Location $fontsDirectory

# ffmpeg dump TTF attachments
& ffmpeg -dump_attachment:t "" -i "..\$inputVideo"

Set-Location ..

Exit
