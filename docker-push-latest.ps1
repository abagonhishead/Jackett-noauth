#!/usr/bin/pwsh
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string[]]$Platforms = @('linux/amd64')
)

$Script:ErrorActionPreference = 'Stop'
$Script:PSNativeCommandUseErrorActionPreference = $true
$platforms = [string]::Join(',', $Platforms)
Write-Debug ('Using platforms string: {0}' -f $platforms)
Invoke-Expression ('docker buildx build --file .\src\Jackett.Server\Dockerfile --platform {0} -t abagonhishead/jackett-noauth:latest --push .' -f $platforms)