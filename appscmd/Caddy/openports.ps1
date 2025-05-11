# Get all network connections with process IDs in one command
$netstat = netstat -ano | Select-String -Pattern "(TCP|UDP)"

# Create a hashtable for process lookups (much faster than querying each time)
$processDict = @{}
Get-Process | ForEach-Object { $processDict[$_.Id] = $_.ProcessName }

# Process each connection
foreach ($connection in $netstat) {
    # Extract the process ID (last column)
    if ($connection -match '(\d+)$') {
        $procID = $matches[1]
        
        # Look up process name from our dictionary
        $processName = $processDict[[int]$procID]
        
        # Add process name to process ID
        $updatedLine = $connection -replace "$procID$", "$procID $processName"
        $updatedLine
    }
    else {
        # Output the original line if no process ID is found
        $connection
    }
}

Read-Host -Prompt "Press Enter to exit"
Exit
