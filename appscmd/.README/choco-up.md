# [choco-up.bat](/appscmd/choco-up.bat)

## Description

`choco-up.bat` is a Windows batch script designed to streamline the process of checking and upgrading outdated Chocolatey packages. This script provides a convenient way to list outdated packages and offers the option to upgrade them all in a single command.

## Prerequisites

- [Chocolatey](https://chocolatey.org/): Chocolatey must be installed on your system to use this script. If you haven't installed Chocolatey yet, you can do so by following the installation instructions on the [Chocolatey website](https://chocolatey.org/install).

## Usage

1. Open a command prompt with administrator privileges. (to allow it to make system changes)

2. Run the script by executing the following command: `choco-up.bat`

- Lists all outdated Chocolatey packages using `choco outdated`.

- Asks if you want to upgrade all outdated packages.

- If you enter 'y', it will proceed to upgrade all outdated packages using `choco upgrade all -y`.

- Otherwise, it will cancel the upgrade process.

## Important Notes

- Review the list of outdated packages carefully before choosing to upgrade them all, as upgrading packages may introduce changes or compatibility issues.
