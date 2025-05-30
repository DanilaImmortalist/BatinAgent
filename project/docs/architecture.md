# Batin Assistant Architecture

## Overview
Self-evolving personal AI assistant built on 100% n8n workflows.

## Core Components

### Workflows Structure
```
workflows/
├── core/                    # System workflows
├── agents/                  # Specialized workflows  
├── evolution/               # Self-evolution workflows
├── integrations/            # External service workflows
└── deployment/              # Deployment automation
```

### Key Workflows
- **Orchestrator**: Central request router
- **Telegram Bot**: User interface
- **Architecture Planning**: Evolution planning
- **Gap Detection**: Capability analysis
- **Workflow Generator**: Automated workflow creation

## Self-Evolution Process
1. Gap Detection → Capability analysis
2. Architecture Planning → Solution design  
3. Workflow Generation → JSON creation
4. Deployment → n8n API integration
5. Monitoring → Performance tracking

## Infrastructure
- **Platform**: n8n hosted on Render.com
- **Database**: Supabase (PostgreSQL)
- **Interface**: Telegram Bot + API
- **AI**: OpenAI/Anthropic nodes
- **Evolution**: n8n API integration 