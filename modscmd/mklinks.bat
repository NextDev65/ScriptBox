@echo off
:: Link
set dest=%~f1
set dest=%dest:"=%
:: Target
set "source=%~f2"
set "source=%source:"=%"
::set source=%CD:"=%

:: softlink / symlink
for /f "usebackq delims=|" %%f in (`dir /b "%source%"`) do (mklink "%dest%\%%f" "%source%\%%f")
:: hardlink
::for /f "usebackq delims=|" %%f in (`dir /b "%source%"`) do (mklink /h "%dest%\%%f" "%source%\%%f")

::SETLOCAL ENABLEDELAYEDEXPANSION
::for /f "usebackq delims=|" %%f in (`dir /b "!source!"`) do (mklink /h "!dest!\%%f" "!source!\%%f")
