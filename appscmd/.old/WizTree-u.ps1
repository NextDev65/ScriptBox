# Extract the download link
$response = Invoke-WebRequest -Uri "https://diskanalyzer.com/download"
$downloadLink = $response.Links | Where-Object { $_.Href -like "*wiztree_*_portable.zip" } | Select-Object -ExpandProperty Href

# Output the download link
Invoke-WebRequest "https://diskanalyzer.com/$downloadLink"

# Unzip the exe
7zo.bat wiztree_*_portable.zip .

# Delete excess
cmd.exe /C "rd /S /Q locale"
DEL license.txt
DEL WizTree.exe

Exit
