#!/bin/bash

# Installation & Usage:
# Run one of the following commands based on your shell environment:

# For Linux/macOS (Bash):
#   curl -Ls bess.ai/croc | bash
#   wget -qO- bess.ai/croc | bash

# For Windows (PowerShell):
#   irm -Uri bess.ai/croc | iex
#   iwr bess.ai/croc -UseBasicParsing | iex


echo --% >/dev/null;: ' | out-null
<#'

#
# Bash / Linux / macOS part
#
echo "Detected Linux/macOS or Bash environment. Installing croc with bash install script..."
curl https://getcroc.schollz.com | bash

exit #>


#
# PowerShell part
#

Write-Host "Detected Windows OS in PowerShell."

if ($null -ne (Get-Command "choco" -ErrorAction SilentlyContinue)) {
    Write-Host "choco found. Installing croc with choco..."
    choco install croc -y
    return
}

if ($null -ne (Get-Command "scoop" -ErrorAction SilentlyContinue)) {
    Write-Host "scoop found. Installing croc with scoop..."
    scoop install croc
    return
}

if ($null -ne (Get-Command "winget" -ErrorAction SilentlyContinue)) {
    Write-Host "winget found. Installing croc with winget..."
    winget install --id=schollz.croc -e
    return
}

Write-Host "No package manager found. Installing scoop..."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# iwr -useb get.scoop.sh | iex
irm -Uri get.scoop.sh | iex
Write-Host "Installing croc with scoop..."
scoop install croc
