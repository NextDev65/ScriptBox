# merge.ps1
<#
TODO
    Desc
#>

#[CmdletBinding(PositionalBinding=$false)]
param (
    [Parameter(Mandatory, Position=0, ValueFromRemainingArguments, ValueFromPipeline)]
    [String[]]$InputFiles = $(throw "Not enough InputFiles!"),
    [String]$BaseName
)
#Write-Host "InputFiles: " $InputFiles ""
#Write-Host "BaseName: " $BaseName ""
#Write-Host "args: " $args ""

# Combine the base names of input files for creating the output file name
If (-Not $BaseName) {
    $OutputBaseName = ($InputFiles | ForEach-Object { (Get-Item $_).BaseName }) -join ", "
}
Else { $OutputBaseName = $BaseName }
$OutputFileName = $OutputBaseName + (Get-Item $InputFiles[0]).Extension
#Write-Host "OutputBaseNames: " $OutputBaseNames ""
#Write-Host "OutputFileName: " $OutputFileName ""

# Create a temporary file containing "file 'inputFilePath'" entries for FFmpeg
#$InputFiles | ForEach-Object { "file '$_'" } | Out-File -Append -Encoding Default -FilePath mergein.txt
foreach ($i in $InputFiles) {"file '$i'" | Out-File -Append -Encoding Default -FilePath mergein.txt}

# Use FFmpeg to concatenate and merge the input files into the output file
ffmpeg.exe -safe 0 -f concat -i mergein.txt -c copy $OutputFileName

# Clean up by removing the temporary and input files
Remove-Item -Path mergein.txt
#Remove-Item -Path $InputFiles

Return $OutputFileName
#Exit