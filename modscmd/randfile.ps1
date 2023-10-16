# WSL
# just filenames
#wsl ls -R `| shuf
# relative paths
#wsl find . `| shuf
# sort (+compatibility)
#wsl ls -R `| sort -R

# PWSH
# 1 obj
#Get-ChildItem -Path . -Recurse -File | Get-Random -Count 1
# 1 relative path
Get-ChildItem -Path . -Recurse -File | Get-Random -Count 1 | Resolve-Path -Relative

# Examples
# MPV no-video
#mpv --no-video (Get-ChildItem -Path . -Recurse -File | Resolve-Path -Relative | Get-Random -Count 1)
