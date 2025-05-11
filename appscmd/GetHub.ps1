# GetHub -Owner 'username' -Repo 'repository' -FileName 'file name'
# GetHub -Owner 'username' -Repo 'repository' -RegexPattern 'regex pattern'

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true, ParameterSetName="GithubFileName")]
    [Parameter(Mandatory=$true, ParameterSetName="GithubRegexPattern")]
    [string]$Owner,

    [Parameter(Mandatory=$true, ParameterSetName="GithubFileName")]
    [Parameter(Mandatory=$true, ParameterSetName="GithubRegexPattern")]
    [string]$Repo,

    #[Parameter(Mandatory=$true, ParameterSetName="GithubFileName")]
    #[Parameter(Mandatory=$true, ParameterSetName="GithubRegexPattern")]
    #[string]$Token,

    [Parameter(Mandatory=$true, ParameterSetName="HTMLFileName")]
    [Parameter(Mandatory=$true, ParameterSetName="HTMLRegexPattern")]
    [string]$HTML,

    [Parameter(Mandatory=$true, ParameterSetName="GithubFileName")]
    [Parameter(Mandatory=$true, ParameterSetName="HTMLFileName")]
    [string]$FileName,

    [Parameter(Mandatory=$true, ParameterSetName="GithubRegexPattern")]
    [Parameter(Mandatory=$true, ParameterSetName="HTMLRegexPattern")]
    [string]$RegexPattern
)

$ParamSetName = $PSCmdlet.ParameterSetName
$assetName = $null

switch ($ParamSetName) {
    'GithubFileName' {
        # Construct the GitHub API URL to fetch release information
        $apiUrl = "https://github.com/$Owner/$Repo/releases/latest/download/$FileName"
        
        # Download file
        $assetName = $FileName
        Invoke-WebRequest -Uri $apiUrl -OutFile $assetName -Resume

        $currentDate = Get-Date
        Write-Host "Downloaded: $assetName"
        Write-Host "Assets downloaded from the latest release as of $currentDate."
    }
    'GithubRegexPattern' {
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
            #    Write-Host "Multiple assets match the regex pattern '$RegexPattern' in the latest release '$latestReleaseName'. Please refine the pattern."
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
            Write-Host 'Failed to fetch release information from GitHub. Please check repository details.'
            #Write-Host 'Failed to fetch release information from GitHub. Please check your credentials and repository details.'
        }
    }
    { $_ -eq "HTMLFileName" -or $_ -eq "HTMLRegexPattern" } {
        $response = Invoke-WebRequest -Uri $HTML# -Headers $headers
        
        if ($response) {
            # Get all links from the page
            $links = $response.Links
            
            # if ($FileName) { $command += "-like '*$FileName*'" }
            # else #($RegexPattern) { $command += "-match '$RegexPattern'" }
            # Filter assets based on the file name or regex pattern
            if ($FileName) {
                $filteredAssets = $links | Where-Object { 
                    $_.href -like "*$FileName*" -or
                    $_.outerHTML -like "*$FileName*" -or
                    $_.innerHTML -like "*$FileName*"
                }# | Select-Object -First 1
            } else {# ($RegexPattern)
                $filteredAssets = $links | Where-Object { 
                    $_.href -match "$RegexPattern" -or
                    $_.outerHTML -match "$RegexPattern" -or
                    $_.innerHTML -match "$RegexPattern"
                }# | Select-Object -First 1
            }

            if ($filteredAssets.Count -eq 0) {
                Write-Host 'No assets match' ($FileName ?? $RegexPattern)
                #PS5# Write-Host ('No assets match ' + $(if ($null -ne $FileName) { $FileName } else { $RegexPattern }))
            #} elseif ($filteredAssets.Count -gt 1) {
            #    Write-Host "Multiple assets match '$RegexPattern'. Please refine the pattern."
            } else {
                # Download the filtered assets
                foreach ($asset in $filteredAssets) {
                    $downloadUrl = $asset.href
                    
                    # Resolve relative URLs if needed
                    if ($downloadUrl -notlike "http*") {
                        $baseUri = [System.Uri]$HTML
                        $downloadUrl = New-Object System.Uri($baseUri, $downloadUrl)
                    }
                    
                    # Determine output filename
                    if ($FileName) {
                        $assetName = $FileName
                    } else {# (RegexPattern)
                        $assetName = Split-Path $downloadUrl -Leaf
                    }
                    
                    $stats = Invoke-WebRequest -Uri $downloadUrl -OutFile $assetName -Resume
                    Write-Host "Downloaded: $assetName"
                }
                Write-Host "Assets downloaded from '$HTML'."
            }
        } else {
            Write-Host "Failed to fetch '$HTML'. Please check the url"
        }
    }
    default { Write-Output "Unknown parameter set $ParamSetName" }
}

Return $assetName
