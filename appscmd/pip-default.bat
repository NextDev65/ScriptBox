@echo off

:: virtual env
pip install pipenv
:: whl binary support
pip install wheel
:: autoremove dependencies
pip install python3-pip-autoremove

:: pep8 checker
::pip install pycodestyle
:: pep8 autoformatting
::pip install black

EXIT /b
