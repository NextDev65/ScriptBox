# [choco-un.bat](appscmd/choco-un.bat)

## Description

`choco-un.bat` is a Windows batch script designed to simplify the process of uninstalling a Chocolatey package and its dependencies. This script takes the name of the package you want to uninstall as an argument and removes it along with any dependent packages.

## Prerequisites

- [Chocolatey](https://chocolatey.org/): Chocolatey must be installed on your system to use this script. If you haven't installed Chocolatey yet, you can do so by following the installation instructions on the [Chocolatey website](https://chocolatey.org/install).

## Usage

1. Open a command prompt with administrator privileges. (to allow it to make system changes)

2. Run the script by executing the following command: `choco-un "package-name"`

This will uninstall the specified Chocolatey package along with its dependencies.

## Important Notes

- Be cautious when using this script, as it removes both the specified package and its dependencies. Make sure you want to uninstall all dependencies before proceeding.
