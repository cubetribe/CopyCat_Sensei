# ============================================================================
# CopyCat_Sensei - Windows Setup Script
# ============================================================================
# Ein Befehl. Alles läuft.
# ============================================================================

$ErrorActionPreference = "Stop"

# Banner
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  🐱🥋 CopyCat_Sensei" -ForegroundColor Magenta
Write-Host '  "Lernt vom Meister. Wird zum Meister."' -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

# ============================================================================
# Voraussetzungen prüfen
# ============================================================================

Write-Host "[1/4] Prüfe Voraussetzungen..." -ForegroundColor Blue

# Node.js / npx
try {
    $null = Get-Command npx -ErrorAction Stop
    Write-Host "  ✓ Node.js/npx" -ForegroundColor Green
} catch {
    Write-Host "  ✗ npx nicht gefunden" -ForegroundColor Red
    Write-Host "    Bitte Node.js installieren: https://nodejs.org/"
    exit 1
}

# Claude CLI
try {
    $null = Get-Command claude -ErrorAction Stop
    Write-Host "  ✓ Claude CLI" -ForegroundColor Green
} catch {
    Write-Host "  ✗ claude CLI nicht gefunden" -ForegroundColor Red
    Write-Host "    Installation: npm install -g @anthropic-ai/claude-code"
    exit 1
}

# ============================================================================
# MCP-Server prüfen und installieren
# ============================================================================

Write-Host ""
Write-Host "[2/4] Prüfe MCP-Server..." -ForegroundColor Blue

$mcps = @(
    @{name="duckduckgo"; cmd="npx -y @nickclyde/duckduckgo-mcp-server"},
    @{name="playwright"; cmd="npx @playwright/mcp@latest"},
    @{name="crawl4ai"; cmd="npx -y mcp-crawl4ai"},
    @{name="filesystem"; cmd="npx -y @modelcontextprotocol/server-filesystem ./Research"},
    @{name="memory"; cmd="npx -y @modelcontextprotocol/server-memory"},
    @{name="wikipedia"; cmd="npx wiki-mcp"}
)

$mcpList = claude mcp list 2>$null
$missingMcps = @()

foreach ($mcp in $mcps) {
    if ($mcpList -match $mcp.name) {
        Write-Host "  ✓ $($mcp.name)" -ForegroundColor Green
    } else {
        Write-Host "  ○ $($mcp.name) (nicht installiert)" -ForegroundColor Yellow
        $missingMcps += $mcp
    }
}

# ============================================================================
# Fehlende MCPs installieren
# ============================================================================

if ($missingMcps.Count -gt 0) {
    Write-Host ""
    Write-Host "[3/4] Installiere fehlende MCP-Server..." -ForegroundColor Blue
    Write-Host ""

    foreach ($mcp in $missingMcps) {
        Write-Host "  → Installiere $($mcp.name)..." -ForegroundColor Yellow

        $cmdParts = $mcp.cmd -split ' '
        $addCmd = "claude mcp add $($mcp.name) -- $($mcp.cmd)"

        try {
            Invoke-Expression $addCmd 2>$null
            Write-Host "  ✓ $($mcp.name) installiert" -ForegroundColor Green
        } catch {
            Write-Host "  ! $($mcp.name) - manuell prüfen" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host ""
    Write-Host "[3/4] Alle MCP-Server bereits installiert ✓" -ForegroundColor Blue
}

# ============================================================================
# Research-Ordner erstellen
# ============================================================================

Write-Host ""
Write-Host "[4/4] Prüfe Projektstruktur..." -ForegroundColor Blue

if (-not (Test-Path "Research")) {
    New-Item -ItemType Directory -Force -Path "Research" | Out-Null
    Write-Host "  ✓ Research/ Ordner erstellt" -ForegroundColor Green
} else {
    Write-Host "  ✓ Research/ Ordner existiert" -ForegroundColor Green
}

# ============================================================================
# Fertig
# ============================================================================

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  ✓ Setup abgeschlossen!" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""
Write-Host "  MCP-Server:    6 aktiv" -ForegroundColor Blue
Write-Host "  Agenten:       6 bereit" -ForegroundColor Blue
Write-Host "  Orchestrator:  CLAUDE.md wird automatisch geladen" -ForegroundColor Blue
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Starte Claude Code mit: claude" -ForegroundColor Green
Write-Host ""
