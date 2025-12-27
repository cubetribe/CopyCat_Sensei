# MCP Server Reference

> Fallback-Dokumentation für alle MCP-Server die CopyCat_Sensei benötigt.

Letzte Aktualisierung: 2024-12-27

---

## Übersicht

| Server | NPM Package | GitHub | Status |
|--------|-------------|--------|--------|
| DuckDuckGo | `@nickclyde/duckduckgo-mcp-server` | [nickclyde/duckduckgo-mcp-server](https://github.com/nickclyde/duckduckgo-mcp-server) | ✅ Aktiv |
| Playwright | `@playwright/mcp` | [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) | ✅ Aktiv |
| Crawl4AI | `@gkzhb/crawl4ai-mcp` | [gkzhb/crawl4ai-mcp](https://github.com/gkzhb/crawl4ai-mcp) | ✅ Aktiv |
| Filesystem | `@modelcontextprotocol/server-filesystem` | [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) | ✅ Offiziell |
| Memory | `@modelcontextprotocol/server-memory` | [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) | ✅ Offiziell |
| Wikipedia | `@shelm/wikipedia-mcp-server` | [Rudra-ravi/wikipedia-mcp](https://github.com/Rudra-ravi/wikipedia-mcp) | ✅ Community |

---

## Installations-Befehle

```bash
# DuckDuckGo - Web-Suche
claude mcp add duckduckgo -- npx -y @nickclyde/duckduckgo-mcp-server

# Playwright - Browser-Automation (von Microsoft)
claude mcp add playwright -- npx @playwright/mcp@latest

# Crawl4AI - Deep Web Crawling
claude mcp add crawl4ai -- npx -y @gkzhb/crawl4ai-mcp

# Filesystem - Datei-Operationen (offizielles MCP)
claude mcp add filesystem -- npx -y @modelcontextprotocol/server-filesystem ./Research

# Memory - Persistenter Speicher (offizielles MCP)
claude mcp add memory -- npx -y @modelcontextprotocol/server-memory

# Wikipedia - Hintergrundinfos
claude mcp add wikipedia -- npx -y @shelm/wikipedia-mcp-server
```

---

## Detaillierte Server-Info

### 1. DuckDuckGo Search

**Primär:**
- NPM: [@nickclyde/duckduckgo-mcp-server](https://www.npmjs.com/package/@nickclyde/duckduckgo-mcp-server)
- GitHub: https://github.com/nickclyde/duckduckgo-mcp-server
- Installation: `npx -y @nickclyde/duckduckgo-mcp-server`

**Alternativen:**
- Python: `pip install duckduckgo-mcp-server-maintained` ([PyPI](https://pypi.org/project/duckduckgo-mcp-server-maintained/))

**Features:**
- Web Search mit DuckDuckGo
- Content Fetching
- Rate Limiting eingebaut
- LLM-optimierte Ergebnisse

---

### 2. Playwright Browser

**Primär:**
- NPM: [@playwright/mcp](https://www.npmjs.com/package/@playwright/mcp)
- GitHub: https://github.com/microsoft/playwright-mcp
- Installation: `npx @playwright/mcp@latest`

**Alternativen:**
- [@executeautomation/playwright-mcp-server](https://www.npmjs.com/package/@executeautomation/playwright-mcp-server)

**Features:**
- Browser-Automation
- Accessibility Snapshots
- Screenshot & Navigation
- Keine Vision Models nötig

**Maintainer:** Microsoft (sehr aktiv gepflegt)

---

### 3. Crawl4AI Web Crawler

**Primär:**
- NPM: [@gkzhb/crawl4ai-mcp](https://www.npmjs.com/package/@gkzhb/crawl4ai-mcp)
- GitHub: https://github.com/gkzhb/crawl4ai-mcp
- Installation: `npx -y @gkzhb/crawl4ai-mcp`

**Alternativen:**
| Package | GitHub | Typ |
|---------|--------|-----|
| @iflow-mcp/mcp-crawl4ai-ts | [omgwtfwow/mcp-crawl4ai-ts](https://github.com/omgwtfwow/mcp-crawl4ai-ts) | TypeScript |
| crawl4ai-mcp-server | [BjornMelin/crawl4ai-mcp-server](https://github.com/BjornMelin/crawl4ai-mcp-server) | CloudFlare |
| mcp-crawl4ai-rag | [coleam00/mcp-crawl4ai-rag](https://github.com/coleam00/mcp-crawl4ai-rag) | RAG-fokussiert |

**Hinweis:** Einige Varianten benötigen Crawl4AI Docker Server auf Port 11235.

---

### 4. Filesystem (Offiziell)

**Primär:**
- NPM: [@modelcontextprotocol/server-filesystem](https://www.npmjs.com/package/@modelcontextprotocol/server-filesystem)
- GitHub: https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem
- Installation: `npx -y @modelcontextprotocol/server-filesystem [verzeichnis]`

**Features:**
- Sichere Dateioperationen
- Konfigurierbare Zugriffskontrolle
- Read/Write/List/Search

**Maintainer:** Anthropic (offizielles MCP)

---

### 5. Memory (Offiziell)

**Primär:**
- NPM: [@modelcontextprotocol/server-memory](https://www.npmjs.com/package/@modelcontextprotocol/server-memory)
- GitHub: https://github.com/modelcontextprotocol/servers/tree/main/src/memory
- Installation: `npx -y @modelcontextprotocol/server-memory`

**Features:**
- Knowledge Graph
- Persistente Memory across Sessions
- Entity/Relation Management
- JSON Lines Format

**Maintainer:** Anthropic (offizielles MCP)

---

### 6. Wikipedia

**Primär:**
- NPM: [@shelm/wikipedia-mcp-server](https://www.npmjs.com/package/@shelm/wikipedia-mcp-server)
- Installation: `npx -y @shelm/wikipedia-mcp-server`

**Alternativen:**
| Package | GitHub | Features |
|---------|--------|----------|
| wikipedia-mcp | [Rudra-ravi/wikipedia-mcp](https://github.com/Rudra-ravi/wikipedia-mcp) | Multi-Language |
| wikipedia-mcp | [timjuenemann/wikipedia-mcp](https://github.com/timjuenemann/wikipedia-mcp) | TypeScript |
| mcp-wikipedia | [algonacci/mcp-wikipedia](https://github.com/algonacci/mcp-wikipedia) | Einfach & lean |
| MediaWiki-MCP | [ProfessionalWiki/MediaWiki-MCP](https://github.com/ProfessionalWiki/MediaWiki-MCP) | Allgemeines MediaWiki |

---

## Troubleshooting

### MCP startet nicht

```bash
# Prüfe ob MCP installiert ist
claude mcp list

# Entferne und installiere neu
claude mcp remove [name]
claude mcp add [name] -- [command]
```

### Package nicht gefunden

Falls ein NPM Package nicht mehr existiert:

1. Prüfe diese Datei auf Alternativen
2. Suche auf [npmjs.com](https://www.npmjs.com) nach `mcp [servername]`
3. Suche auf GitHub nach `mcp [servername] server`

### Verbindungsprobleme

- **Timeout:** Server startet on-demand, ersten Request abwarten
- **Connection refused:** Prüfe ob Node.js installiert ist
- **Package deprecated:** Nutze Alternative aus dieser Liste

---

## Nützliche Links

- [MCP Protocol Docs](https://modelcontextprotocol.io/)
- [Offizielle MCP Servers](https://github.com/modelcontextprotocol/servers)
- [MCP Server Registry](https://github.com/punkpeye/awesome-mcp-servers)
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code)
