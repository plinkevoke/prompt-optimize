# build.ps1 - Prompt Optimizer Build Script
# Usage: .\build.ps1

param(
    [string]$SourceDir = $PSScriptRoot,
    [string]$OutputDir = (Join-Path $PSScriptRoot "dist")
)

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Prompt Optimizer - Build Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check source file
$skillFile = Join-Path $SourceDir "SKILL.md"
if (-not (Test-Path $skillFile)) {
    Write-Error "SKILL.md not found. Please run this script from the project root."
    exit 1
}

# Create output directory
if (Test-Path $OutputDir) {
    Remove-Item -Recurse -Force $OutputDir
}
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

Write-Host "Output directory: $OutputDir" -ForegroundColor Green
Write-Host ""

# ============================================
# 1. Build Agent Skills standard package
# ============================================
Write-Host "[1/4] Building Agent Skills package..." -ForegroundColor Yellow

$agentSkillDir = Join-Path $OutputDir "prompt-optimizer"
New-Item -ItemType Directory -Force -Path $agentSkillDir | Out-Null

# Copy core files
$coreFiles = @("SKILL.md", "README.md", "CHANGELOG.md")
foreach ($file in $coreFiles) {
    $src = Join-Path $SourceDir $file
    if (Test-Path $src) {
        Copy-Item $src $agentSkillDir -Force
    }
}

# Copy directories
$dirs = @("references", "templates", "assets", "scripts")
foreach ($dir in $dirs) {
    $src = Join-Path $SourceDir $dir
    if (Test-Path $src) {
        Copy-Item -Recurse $src $agentSkillDir -Force
    }
}

Write-Host "      Done - Agent Skills package" -ForegroundColor Green

# ============================================
# 2. Build VS Code / GitHub Copilot version
# ============================================
Write-Host "[2/4] Building VS Code / Copilot version..." -ForegroundColor Yellow

$copilotDir = Join-Path $OutputDir "vscode-copilot"
New-Item -ItemType Directory -Force -Path $copilotDir | Out-Null

$copilotSrc = Join-Path $SourceDir "platform\vscode-copilot"
if (Test-Path $copilotSrc) {
    Copy-Item -Recurse "$copilotSrc\*" $copilotDir -Force
}

Write-Host "      Done - VS Code / Copilot version" -ForegroundColor Green

# ============================================
# 3. Build TRAE version
# ============================================
Write-Host "[3/4] Building TRAE version..." -ForegroundColor Yellow

$traeDir = Join-Path $OutputDir "trae"
New-Item -ItemType Directory -Force -Path $traeDir | Out-Null

Copy-Item -Recurse "$agentSkillDir\*" $traeDir -Force

$traeReadme = Join-Path $SourceDir "platform\trae\README.md"
if (Test-Path $traeReadme) {
    Copy-Item $traeReadme (Join-Path $traeDir "INSTALL.md") -Force
}

Write-Host "      Done - TRAE version" -ForegroundColor Green

# ============================================
# 4. Build Claude Code version
# ============================================
Write-Host "[4/4] Building Claude Code version..." -ForegroundColor Yellow

$claudeDir = Join-Path $OutputDir "claude-code"
New-Item -ItemType Directory -Force -Path $claudeDir | Out-Null

Copy-Item -Recurse "$agentSkillDir\*" $claudeDir -Force

$claudeReadme = Join-Path $SourceDir "platform\claude\README.md"
if (Test-Path $claudeReadme) {
    Copy-Item $claudeReadme (Join-Path $claudeDir "INSTALL.md") -Force
}

Write-Host "      Done - Claude Code version" -ForegroundColor Green

# ============================================
# Copy install script
# ============================================
$installScript = Join-Path $SourceDir "install.ps1"
if (Test-Path $installScript) {
    Copy-Item $installScript $OutputDir -Force
}

# ============================================
# Complete
# ============================================
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Build complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Output: $OutputDir" -ForegroundColor White
Write-Host ""
Write-Host "Packages:" -ForegroundColor White
Write-Host "  - prompt-optimizer/  (Agent Skills standard)" -ForegroundColor Gray
Write-Host "  - claude-code/       (Claude Code)" -ForegroundColor Gray
Write-Host "  - trae/              (TRAE)" -ForegroundColor Gray
Write-Host "  - vscode-copilot/    (VS Code / GitHub Copilot)" -ForegroundColor Gray
Write-Host ""
Write-Host "Run .\install.ps1 to install to current project" -ForegroundColor Yellow
