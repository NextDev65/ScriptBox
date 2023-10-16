@echo off

echo Listing outdated packages...
choco outdated

set /p choice=Do you want to upgrade all outdated packages? (y/n): 
if /i "%choice%"=="y" (
    choco upgrade all -y
) else (
    echo Upgrade canceled.
)
