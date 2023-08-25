# opusenc config Script (opusenc.ps1)
<#
--bitrate 128: Set the target bitrate to 128 kbps (adjust as needed)
--vbr: Use variable bit rate encoding mode
--comp 10: Set encoding complexity (0-10, default: 10 (slowest, but highest quality))
--max-delay 0: Set maximum container delay in milliseconds (0-1000, default: 1000)

$inputFile: Input audio file path
$outputFile: Output Opus audio file path
#>

# Path to the opusenc.exe executable
$opusencPath = "D:\$env:HOMEPATH\Music\util\opus-tools-0.2-win64\opusenc.exe"

# Get the input file path from command-line argument
$inputFile = $args[0]

# Generate the output file path by replacing the extension with .opus
$outputFile = [io.path]::ChangeExtension((Get-Item -LiteralPath $inputFile), "opus")
# Relative Path
#$outputFile = "$((Get-Item -LiteralPath $inputFile).BaseName).opus"
# PS7 #$outputFile = "$($inputFile | Split-Path -LeafBase).opus"

# Execute opusenc.exe with the specified options
& $opusencPath --bitrate 128 --vbr --comp 10 --max-delay 0 $inputFile $outputFile

Return $outputFile
#Exit
