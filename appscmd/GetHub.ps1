# GetHub -Owner 'username' -Repo 'repository' -FileName 'file name'
# GetHub -Owner 'username' -Repo 'repository' -RegexPattern 'regex pattern'

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]$Owner,

    [Parameter(Mandatory=$true)]
    [string]$Repo,

    #[Parameter(Mandatory=$true)]
    #[string]$Token,

    [Parameter(Mandatory=$true, ParameterSetName="FileName")]
    [string]$FileName,
    
    [Parameter(Mandatory=$true, ParameterSetName="RegexPattern")]
    [string]$RegexPattern
)

If ($FileName)
{
    # Construct the GitHub API URL to fetch release information
    $apiUrl = "https://github.com/$Owner/$Repo/releases/latest/download/$FileName"
    
    # Download file
    $stats = Invoke-WebRequest -Uri $apiUrl -OutFile $FileName -Resume
    $assetName = $FileName
}
Else # ($RegexPattern)
{
    # Construct the GitHub API URL to fetch release information
    $apiUrl = "https://api.github.com/repos/$Owner/$Repo/releases/latest"

    # Set a user agent header for GitHub API requests
    $headers = @{
        'User-Agent' = 'GetHub'
        #"Authorization" = "token $Token"
    }

    # Invoke the GitHub API to get the latest release details
    $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers

    # Check if the request was successful
    if ($response) {
        # if name is empty use tag_name
        $latestReleaseName = if ($response.name) { $response.name } else { $response.tag_name }
        $assets = $response.assets

        # Filter assets based on the regex pattern
        $filteredAssets = $assets | Where-Object { $_.name -match $RegexPattern }

        if ($filteredAssets.Count -eq 0) {
            Write-Host "No assets match the regex pattern '$RegexPattern' in the latest release '$latestReleaseName'."
        #} elseif ($filteredAssets.Count -gt 1) {
        #    Write-Host "Multiple assets match the regex pattern '$RegexPattern' in the latest release '$latestReleaseName'. Refine the pattern."
        } else {
            # Download the filtered assets
            foreach ($asset in $filteredAssets) {
                $downloadUrl = $asset.browser_download_url
                $assetName = $asset.name
                $stats = Invoke-WebRequest -Uri $downloadUrl -OutFile $assetName -Resume
                Write-Host "Downloaded: $assetName"
            }
            Write-Host "Assets downloaded from the latest release '$latestReleaseName'."
        }
    } else {
        #Write-Host 'Failed to fetch release information from GitHub. Please check your credentials and repository details.'
        Write-Host 'Failed to fetch release information from GitHub. Please check repository details.'
    }
}

Return $assetName
