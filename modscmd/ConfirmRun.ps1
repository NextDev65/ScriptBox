param (
    [string]$Command
)

$input = Read-Host -Prompt "Run '$Command' ?"
Invoke-Expression "$Command"
