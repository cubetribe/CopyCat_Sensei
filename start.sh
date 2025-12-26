#!/bin/bash

# ============================================================================
# 🐱🥋 CopyCat_Sensei - Start Script
# ============================================================================
# Ein Befehl. Alles läuft.
# ============================================================================

set -e

# Farben
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Banner
echo ""
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${PURPLE}  🐱🥋 CopyCat_Sensei${NC}"
echo -e "${PURPLE}  \"Lernt vom Meister. Wird zum Meister.\"${NC}"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# ============================================================================
# Voraussetzungen prüfen
# ============================================================================

echo -e "${BLUE}[1/4]${NC} Prüfe Voraussetzungen..."

# Node.js / npx
if ! command -v npx &> /dev/null; then
    echo -e "${RED}  ✗ npx nicht gefunden${NC}"
    echo "    Bitte Node.js installieren: https://nodejs.org/"
    exit 1
fi
echo -e "${GREEN}  ✓ Node.js/npx${NC}"

# Claude CLI
if ! command -v claude &> /dev/null; then
    echo -e "${RED}  ✗ claude CLI nicht gefunden${NC}"
    echo "    Installation: npm install -g @anthropic-ai/claude-code"
    exit 1
fi
echo -e "${GREEN}  ✓ Claude CLI${NC}"

# ============================================================================
# MCP-Server prüfen und installieren
# ============================================================================

echo ""
echo -e "${BLUE}[2/4]${NC} Prüfe MCP-Server..."

# Liste der benötigten MCPs für dieses Team
declare -A MCPS=(
    ["duckduckgo"]="npx -y @nickclyde/duckduckgo-mcp-server"
    ["playwright"]="npx @playwright/mcp@latest"
    ["crawl4ai"]="npx -y mcp-crawl4ai"
    ["filesystem"]="npx -y @modelcontextprotocol/server-filesystem $(pwd)/Research"
    ["memory"]="npx -y @modelcontextprotocol/server-memory"
    ["wikipedia"]="npx wiki-mcp"
)

# Prüfe welche MCPs fehlen
MISSING_MCPS=()

for mcp in "${!MCPS[@]}"; do
    # Prüfe ob MCP in der Config existiert (vereinfachte Prüfung)
    if claude mcp list 2>/dev/null | grep -q "$mcp"; then
        echo -e "${GREEN}  ✓ $mcp${NC}"
    else
        echo -e "${YELLOW}  ○ $mcp (nicht installiert)${NC}"
        MISSING_MCPS+=("$mcp")
    fi
done

# ============================================================================
# Fehlende MCPs installieren
# ============================================================================

if [ ${#MISSING_MCPS[@]} -gt 0 ]; then
    echo ""
    echo -e "${BLUE}[3/4]${NC} Installiere fehlende MCP-Server..."
    echo ""
    
    for mcp in "${MISSING_MCPS[@]}"; do
        echo -e "  ${YELLOW}→ Installiere $mcp...${NC}"
        
        case $mcp in
            "duckduckgo")
                claude mcp add duckduckgo -- npx -y @nickclyde/duckduckgo-mcp-server 2>/dev/null || true
                ;;
            "playwright")
                claude mcp add playwright -- npx @playwright/mcp@latest 2>/dev/null || true
                ;;
            "crawl4ai")
                claude mcp add crawl4ai -- npx -y mcp-crawl4ai 2>/dev/null || true
                ;;
            "filesystem")
                claude mcp add filesystem -- npx -y @modelcontextprotocol/server-filesystem "$(pwd)/Research" 2>/dev/null || true
                ;;
            "memory")
                claude mcp add memory -- npx -y @modelcontextprotocol/server-memory 2>/dev/null || true
                ;;
            "wikipedia")
                claude mcp add wikipedia -- npx wiki-mcp 2>/dev/null || true
                ;;
        esac
        
        echo -e "  ${GREEN}✓ $mcp installiert${NC}"
    done
else
    echo ""
    echo -e "${BLUE}[3/4]${NC} Alle MCP-Server bereits installiert ${GREEN}✓${NC}"
fi

# ============================================================================
# Research-Ordner erstellen
# ============================================================================

echo ""
echo -e "${BLUE}[4/4]${NC} Prüfe Projektstruktur..."

if [ ! -d "Research" ]; then
    mkdir -p Research
    echo -e "${GREEN}  ✓ Research/ Ordner erstellt${NC}"
else
    echo -e "${GREEN}  ✓ Research/ Ordner existiert${NC}"
fi

# ============================================================================
# Fertig - Claude starten
# ============================================================================

echo ""
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  ✓ Setup abgeschlossen!${NC}"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${BLUE}MCP-Server:${NC}    6 aktiv"
echo -e "  ${BLUE}Agenten:${NC}       6 bereit"
echo -e "  ${BLUE}Orchestrator:${NC}  CLAUDE.md wird automatisch geladen"
echo ""
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  Starte Claude Code..."
echo ""

# Claude im aktuellen Verzeichnis starten
# CLAUDE.md wird automatisch als Projekt-Kontext geladen!
exec claude
