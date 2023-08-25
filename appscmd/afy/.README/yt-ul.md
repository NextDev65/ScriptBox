# YouTube Uploader Script (yt-ul.ps1)

`yt-ul.ps1` is a PowerShell script for uploading video files to YouTube using youtube-uploader.

## DESCRIPTION
This PowerShell script automates the process of uploading video files to YouTube using `youtube-uploader`. 
It allows you to either upload individual video files or merge and upload them as a single video.

## Usage

You can use this script to upload video files to YouTube. The script supports the following parameters:

- `-Merged`: Specifies that the video files should be merged and uploaded as a single video. Provide the desired base name for the merged video.

## Prerequisites

- PowerShell
- [`youtube-uploader`](https://github.com/porjo/youtubeuploader)
- [`merge.ps1`](https://github.com/NextDev65/ScriptBox)

## Parameters

- `[String]$Merged`: Specifies the base name for the merged video. If this parameter is provided, the script will merge the video files and upload them as a single video.

## Functionality

The script performs the following actions:

1. Get a sorted list of `.mp4` files in the current directory.
2. If the `-Merged` parameter is provided, merge the `.mp4` files and upload the merged video to YouTube.
   - The merged video's base name will be determined by the `$Merged` parameter.
   - The script uses the `Resolve-Path -Relative` cmdlet to obtain relative file paths for the merge process.
   - The merged video is uploaded to YouTube using `youtube-uploader`.
3. If the `-Merged` parameter is not provided, upload each individual `.mp4` file to YouTube.

## Example Usage

To merge and upload video files:
`powershell .\yt-ul.ps1 -Merged "MergedVideo"`

To upload individual video files:
`powershell .\yt-ul.ps1`
