# ScriptBox

box o' scripts in Batch, PowerShell, and Unix (for WSL)

Recommended Install: Add folder(s) to PATH
* [What is Windows PATH and How Do You Add to and Edit it? - Make Tech Easier](https://www.maketecheasier.com/what-is-the-windows-path/)
* Save scripts to the folder(s) you added to your PATH
* You can now run the script from anywhere with just the name (ie: `ff-u`)
* The folders I have in my PATH are `appscmd` and `modscmd`

Local Install: Run in one folder only
* Open the folder you saved the scripts to (in Windows Explorer)
* Click the address bar (The long box with the folder path)
* Type `cmd` or `powershell` and hit enter
* In the console window that pops up, you can run the script
* Keep in mind that running the script from another folder is only possible with relative or absolute paths (ie: `C:\scripts\ffmpeg\ff-u` instead of just `ff-u`)

### Prerequisites

* Each script has its own prerequisites
* PowerShell scripts (`.ps1`) require [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/windows-powershell/install/installing-windows-powershell?view=powershell-7.3) on Windows (you probably already have this; check with `powershell` in a cmd window)
* Batch scripts (`.bat`) require cmd on Windows (all Windows versions have this; type `cmd` in start menu, or in address bar of Windows Explorer)
* UNIX scripts (`.sh` or no extension) require [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows or a Linux OS

Scripts
----
* [choco-u](appscmd/.README/choco-u.md)
* [choco-un](appscmd/.README/choco-un.md)
* [choco-up](appscmd/.README/choco-up.md)
* [GetHub](appscmd/.README/GetHub.md)

### Todo
___
- add readme for all scripts
- update GetHub.md

> Written with [StackEdit](https://stackedit.io/).
