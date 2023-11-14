# GetHub.ps1

## Description

`GetHub.ps1` is a PowerShell script designed to fetch the latest release assets from a GitHub repository. It takes the repository owner, repository name, and a regex pattern as parameters, and then fetches and downloads the release assets that match the given pattern.

## Prerequisites

- **GitHub Repository**: The GitHub repository you are fetching assets from should be public. If it's a private repository, you should have access to it and must use the `Token` parameter for authentication as mentioned below.

## Parameters

The script accepts the following parameters:

- `Owner`: The owner or organization of the GitHub repository.

- `Repo`: The name of the GitHub repository.

- `RegexPattern`: A regular expression pattern used to filter release assets by name.

**Note:** The `Token` parameter is currently commented out but can be uncommented and used for authentication if necessary.

## Usage

1. Open a PowerShell terminal.

2. Run the script using the following command: 
`.\GetHub.ps1 -Owner 'username' -Repo 'repository' -RegexPattern 'regex pattern'`

The script will connect to the GitHub API, retrieve the latest release information, filter assets based on the regex pattern, and download the matching asset(s) to the current directory.

After the script finishes, it will **return** the *name of the last downloaded asset*.
