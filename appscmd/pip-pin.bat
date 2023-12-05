@echo off
:: https://stackoverflow.com/a/40026169
pip freeze -r requirements.txt | wsl sed '/freeze/,$ d'
