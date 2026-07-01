# install.ps1 - Prompt Optimizer Install Script
# Usage:
#   .\install.ps1              # Install to current project (TRAE + Claude Code)
#   .\install.ps1 -Scope Global    # Global install
#   .\install.ps1 -Platform trae   # Install only TRAE
#   .\install.ps1 -Platform all    # Install all platforms

param(
    [ValidateSet("Project", "Global")]
    [string]$Scope = "Project",

    [ValidateSet("trae", "claude", "all")]
    [string]$Platform = "all",

    [string]$SourceDir = $PSScriptRoot
)

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Prompt Optimizer - Install Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check source file
$skillFile = Join-Path $SourceDir "SKILL.md"
if (-not (Test-Path $skillFile)) {
    Write-Error "SKILL.md not found. Please run this script from the project root."
    exit 1
}

# Get target directory
function Get-TargetDir {
    param([string]$platform, [string]$scope)
    
    if ($scope -eq "Global") {
        switch ($platform) {
            "trae" { return Join-Path $env:USERPROFILE ".trae\skills\prompt-optimizer" }
            "claude" { return Join-Path $env:USERPROFILE ".claude\skills\prompt-optimizer" }
        }
    }
    else {
        $projectRoot = Get-Location
        switch ($platform) {
            "trae" { return Join-Path $projectRoot ".trae\skills\prompt-optimizer" }
            "claude" { return Join-Path $projectRoot ".claude\skills\prompt-optimizer" }
        }
    }
}

# Install function
function Install-Skill {
    param([string]$platform, [string]$scope)
    
    $targetDir = Get-TargetDir $platform $scope
    $platformName = switch ($platform) {
        "trae" { "TRAE" }
        "claude" { "Claude Code" }
    }
    
    Write-Host "Installing to $platformName ($scope)..." -ForegroundColor Yellow
    Write-Host "  Target: $targetDir" -ForegroundColor Gray
    
    # Create target directory
    if (Test-Path $targetDir) {
        $confirm = Read-Host "  Already exists. Overwrite? (Y/n)"
        if ($confirm -eq "" -or $confirm -eq "Y" -or $confirm -eq "y") {
            Remove-Item -Recurse -Force $targetDir
        }
        else {
            Write-Host "  Skipped" -ForegroundColor Red
            return
        }
    }
    
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    
    # Copy core files
    $coreFiles = @("SKILL.md", "README.md")
    foreach ($file in $coreFiles) {
        $src = Join-Path $SourceDir $file
        if (Test-Path $src) {
            Copy-Item $src $targetDir -Force
        }
    }
    
    # Copy directories
    $dirs = @("references", "templates", "assets", "scripts")
    foreach ($dir in $dirs) {
        $src = Join-Path $SourceDir $dir
        if (Test-Path $src) {
            Copy-Item -Recurse $src $targetDir -Force
        }
    }
    
    Write-Host "  Done" -ForegroundColor Green
}

# Execute installation
$installed = @()

if ($Platform -eq "all" -or $Platform -eq "trae") {
    Install-Skill "trae" $Scope
    $installed += "TRAE"
}

if ($Platform -eq "all" -or $Platform -eq "claude") {
    Install-Skill "claude" $Scope
    $installed += "Claude Code"
}

# VS Code / Copilot note
if ($Platform -eq "all") {
    Write-Host ""
    Write-Host "Note for VS Code / GitHub Copilot:" -ForegroundColor Cyan
    Write-Host "  Copilot does not support Skill directory structure." -ForegroundColor Gray
    Write-Host "  Please configure manually:" -ForegroundColor Gray
    Write-Host "  1. Open VS Code Settings" -ForegroundColor Gray
    Write-Host "  2. Search 'Copilot Custom Instructions'" -ForegroundColor Gray
    Write-Host "  3. Copy content from platform/vscode-copilot/copilot-instructions.txt" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Installation complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Installed: $($installed -join ', ')" -ForegroundColor White
Write-Host "Scope: $Scope" -ForegroundColor White
Write-Host ""
Write-Host "Usage:" -ForegroundColor White
Write-Host "  /optimize your prompt content" -ForegroundColor Yellow
Write-Host ""
Write-Host "See README.md for more information" -ForegroundColor Gray
