[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$Expression = "Write-Host 'Hi'",
    
    [Parameter(Mandatory = $false)]
    [int]$NumberOfRuns = 4
)

$TotalMilliseconds = 0

1..$NumberOfRuns | ForEach-Object {
    $TotalMilliseconds += (Measure-Command { Invoke-Expression $Expression }).TotalMilliseconds
}

$AverageMilliseconds = $TotalMilliseconds / $NumberOfRuns

"`{ $Expression `} averaged $AverageMilliseconds $NumberOfRuns time(s)"
$AverageMilliseconds
