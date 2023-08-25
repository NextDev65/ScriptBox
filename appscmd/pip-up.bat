@echo off
pip list --outdated | wsl tail +3 ^| cut -d' ' -f1 ^| xargs pip.exe install -U
