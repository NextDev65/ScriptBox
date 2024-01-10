# PWSH

# list                       | randpick 1 | relative path
#Get-ChildItem | Get-Random | Resolve-Path -Relative
# list, recurse              | randpick 1 | relative path
Get-ChildItem -Recurse -File | Get-Random | Resolve-Path -Relative
# list files only, recurse   | randpick 1 | relative path
#Get-ChildItem -Recurse -File | Get-Random | Resolve-Path -Relative


# WSL

# just filenames
#wsl ls -R `| shuf
# relative paths
#wsl find . `| shuf
# sort (+compatibility)
#wsl ls -R `| sort -R


# Examples

# MPV no-video
#mpv --no-video (Get-ChildItem -Recurse -File | Get-Random | Resolve-Path -Relative)
