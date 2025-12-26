# 🐱🥋 CopyCat_Sensei

> **"Lernt vom Meister. Wird zum Meister."**

[![Agents](https://img.shields.io/badge/Agents-6%20Specialists-green)](#die-agenten)
[![MCP Servers](https://img.shields.io/badge/MCP%20Servers-6%20Integrated-purple)](#mcp-server)
[![Cost](https://img.shields.io/badge/API%20Kosten-0%20EUR-brightgreen)](#)
[![One Command](https://img.shields.io/badge/Setup-Zero%20Config-blue)](#installation)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Made for](https://img.shields.io/badge/Made%20for-Claude%20Code-orange)](#)
[![Platform](https://img.shields.io/badge/Platform-Mac%20%7C%20Windows%20%7C%20Linux-lightgrey)](#installation)

---

## Was ist das?

**CopyCat_Sensei** ist ein selbstständiges Research-Team für Claude Code. Es analysiert App-Trends aus Asien und bewertet sie für den deutschen Markt – vollautomatisch.

```
Du: "Finde interessante Fintech-Apps aus China"

CopyCat_Sensei:
  → @interviewer stellt Rückfragen
  → @trend-scout durchsucht asiatische Märkte
  → @market-analyst bewertet DE-Potenzial     ┐
  → @idea-validator prüft kulturelle Passung  ├── parallel
  → @effort-calculator kalkuliert Kosten      ┘
  → @synthesizer liefert Entscheidungs-Report

Du: ☕
```

---

## Installation

### Voraussetzungen

- [Node.js](https://nodejs.org/) (v18+)
- [Claude Code CLI](https://github.com/anthropics/claude-code) (`npm install -g @anthropic-ai/claude-code`)

### Option A: Zero-Config (Empfohlen)

```bash
git clone https://github.com/cubetribe/CopyCat_Sensei.git
cd CopyCat_Sensei
claude
```

**Das war's.** Claude erkennt automatisch, dass die MCP-Server fehlen und installiert sie beim ersten Start. Funktioniert auf **Mac, Windows und Linux**.

### Option B: Manuelles Setup

Falls du lieber ein Setup-Script ausführst:

**Mac / Linux:**
```bash
./start.sh
```

**Windows (PowerShell):**
```powershell
.\setup.ps1
```

### Was passiert beim Setup?

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  🐱🥋 CopyCat_Sensei
  "Lernt vom Meister. Wird zum Meister."
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[1/4] Prüfe Voraussetzungen...
  ✓ Node.js/npx
  ✓ Claude CLI

[2/4] Prüfe MCP-Server...
  ✓ duckduckgo
  ✓ playwright
  ○ crawl4ai (wird installiert...)
  ...

[3/4] Installiere fehlende MCP-Server...
  ✓ crawl4ai installiert

[4/4] Prüfe Projektstruktur...
  ✓ Research/ Ordner erstellt

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✓ Setup abgeschlossen!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Der Workflow

```
[Du] ──► @interviewer ──► @trend-scout ──┬──► @market-analyst   ──┐
                │                        ├──► @idea-validator   ──┼──► @synthesizer ──► [Report]
          Research Brief                 └──► @effort-calculator──┘
              (Gate)                              (parallel)
```

---

## Die Agenten

| Agent | Rolle | MCP-Server |
|-------|-------|------------|
| `@interviewer` | Stellt 3-7 Rückfragen, erstellt Research Brief | – |
| `@trend-scout` | Findet Apps in China, Korea, Japan, SEA | DuckDuckGo, Playwright, Crawl4AI |
| `@market-analyst` | DE-Markt, Wettbewerb, TAM/SAM/SOM | DuckDuckGo, Crawl4AI, Playwright, Wikipedia |
| `@idea-validator` | Kulturelle Passung, Regulatorik, Risiken | Memory, DuckDuckGo, Wikipedia |
| `@effort-calculator` | Tech-Stack, Zeit, Kosten | Filesystem, DuckDuckGo, Crawl4AI |
| `@synthesizer` | Führt alles zusammen, Final Report | Filesystem, Memory |

---

## MCP-Server

Alle kostenlos. Keine API-Keys. Keine versteckten Kosten.

| Server | Funktion | Wird installiert durch |
|--------|----------|----------------------|
| **DuckDuckGo** | Web-Suche | `start.sh` |
| **Playwright** | Browser-Automation | `start.sh` |
| **Crawl4AI** | Deep Web Crawling | `start.sh` |
| **Filesystem** | Report-Speicherung | `start.sh` |
| **Memory** | Persistente Learnings | `start.sh` |
| **Wikipedia** | Hintergrundinfos | `start.sh` |

---

## Projektstruktur

```
CopyCat_Sensei/
├── CLAUDE.md              ← Orchestrator (Auto-Setup + Agenten-Steuerung)
├── start.sh               ← Setup für Mac/Linux
├── setup.ps1              ← Setup für Windows
├── README.md
├── LICENSE
│
├── agents/                ← Die 6 Spezialisten
│   ├── 01-interviewer.md
│   ├── 02-trend-scout.md
│   ├── 03-market-analyst.md
│   ├── 04-idea-validator.md
│   ├── 05-effort-calculator.md
│   └── 06-synthesizer.md
│
└── Research/              ← Output (wird automatisch erstellt)
    └── [YYYY-MM-DD]-[Thema]/
        ├── 00-research-brief.md
        ├── 01-trend-report.md
        ├── 02-market-assessment.md
        ├── 03-validation-report.md
        ├── 04-effort-matrix.md
        └── 05-FINAL-REPORT.md
```

---

## Verwendung

### Erste Recherche starten

Nach dem Setup einfach loslegen:

```
Du: Ich suche nach interessanten Social Apps aus Südkorea

🐱🥋 CopyCat_Sensei aktiv! @interviewer übernimmt...

@interviewer: Bevor ich die Recherche starte, ein paar Fragen:
1. Ziel: Eigene Umsetzung, Auftragsarbeit, oder Marktbeobachtung?
...
```

### Befehle

| Befehl | Aktion |
|--------|--------|
| `Start` / `Neue Recherche` | Startet @interviewer |
| `Status` | Zeigt aktuellen Workflow-Stand |
| `Report zeigen` | Zeigt letzten Final Report |

---

## Multi-Team Setup

CopyCat_Sensei ist als **isoliertes Team** konzipiert. Du kannst mehrere Teams parallel haben:

```
~/Projects/
├── CopyCat_Sensei/        ← Dieses Research Team
│   └── start.sh
│
├── ClaudeCode_GodMode/    ← Dein Dev Team
│   └── start.sh
│
└── [Weiteres_Team]/
    └── start.sh
```

Einfach ins Verzeichnis wechseln und `claude` starten – jedes Team ist isoliert.

---

## FAQ

**Q: Muss ich die MCPs manuell installieren?**
A: Nein. Claude erkennt beim ersten Start automatisch fehlende MCPs und installiert sie.

**Q: Funktioniert das auf Windows?**
A: Ja! Das Auto-Setup funktioniert auf Mac, Windows und Linux. Optional gibt es auch `setup.ps1` für PowerShell.

**Q: Werden meine globalen MCPs überschrieben?**
A: Nein. Es werden nur fehlende MCPs hinzugefügt.

**Q: Kann ich einzelne Agenten anpassen?**
A: Ja! Einfach die `.md` Datei in `agents/` bearbeiten.

**Q: Funktioniert das offline?**
A: Nein. Die Agenten brauchen Web-Zugriff für Recherchen.

---

## Verwandt

Basiert auf der Architektur von [CC_GodMode](https://github.com/cubetribe/ClaudeCode_GodMode-On).

---

## Credits

**Dennis Westermann** – [www.dennis-westermann.de](https://www.dennis-westermann.de)

---

## Lizenz

MIT License

---

## Warum "CopyCat"? 🐱

Weil wir ehrlich sind:

> "Innovation ist 1% Inspiration und 99% schauen was in China funktioniert."
> — Kein Startup-Gründer, jemals (laut)

Asien ist 3-5 Jahre voraus bei Mobile Apps. Was dort heute Mainstream ist, kommt hier morgen. CopyCat_Sensei hilft dir, die richtigen Trends zu finden – bevor es alle anderen tun.

**Copy smart. Not blind.** 🥋

---

**Made for Vibecoding** 🎸

*"Lernt vom Meister. Wird zum Meister."*

⭐ Star if it helps ⭐
