#!/usr/bin/pwsh
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [switch]$NoBuild
)

$Script:ErrorActionPreference = 'Stop'
$Script:PSNativeCommandUseErrorActionPreference = $true

$CONTAINER_NAME = 'jackett-noauth'
$IMAGE_NAME = 'jackett-noauth'
$IMAGE_TAG = 'dev'
$HOST_PORT = 9117
$CONTAINER_PORT = 9117

$buildContext = Get-Item (Invoke-Expression 'git rev-parse --show-toplevel')
$dockerfile = Get-Item (Join-Path $buildContext.FullName 'src' 'Jackett.Server' 'Dockerfile')

if (((Invoke-Expression 'docker container ls --all --format "{{json .}}"' | ConvertFrom-Json).Names) -contains $CONTAINER_NAME)
{
    Invoke-Expression ('docker container rm {0} --force' -f $CONTAINER_NAME)
}

if (!$NoBuild.IsPresent)
{
    Write-Host ('Building image (pass -NoBuild to skip)...')
    Invoke-Expression ('docker build -f "{0}" "{1}" -t {2}:{3}' -f $dockerfile.FullName, $buildContext.FullName, $IMAGE_NAME, $IMAGE_TAG)
}

Write-Host ('Starting container...')
Invoke-Expression ('docker run --name "{0}" --rm -p {1}:{2} {3}:{4}' -f $CONTAINER_NAME, $HOST_PORT, $CONTAINER_PORT, $IMAGE_NAME, $IMAGE_TAG)