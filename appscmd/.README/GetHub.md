# GetHub.ps1

## Description

`GetHub.ps1` is a PowerShell script designed to fetch the latest release assets from a GitHub repository. It takes the repository owner, repository name, and a regex pattern as parameters, and then fetches and downloads the release assets that match the given pattern.

## Prerequisites

- GitHub Repository: The GitHub repo you are updating from should be public. If not, you should have access to it and use the `Token` parameter as mentioned below.

## Parameters

The script accepts the following parameters:

- `Owner`: The owner or organization of the GitHub repository.

- `Repo`: The name of the GitHub repository.

- `RegexPattern`: A regular expression pattern used to filter release assets by name.

**Note:** The `Token` parameter is currently commented out but can be uncommented and used for authentication if necessary.

## Usage

1. Open a PowerShell terminal.

2. Run the script using the following command: 
`.\GetHub.ps1 -Owner "username" -Repo "repository" -RegexPattern "regex pattern"`

This will download the asset from the latest release matching the regex pattern.
