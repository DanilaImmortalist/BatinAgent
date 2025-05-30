# Tech Context: Batin AI Assistant

## Technology Stack

### Core Platform
- **Primary Platform**: **n8n** (единственная платформа разработки - ВСЕ компоненты)
- **Hosting**: Render.com для n8n instance + automatic CI/CD
- **Database**: Supabase (PostgreSQL + realtime + auth)
- **Development**: 100% visual workflows, no programming required
- **Deployment**: n8n workflow JSON exports + automated import

### 100% n8n Workflow Architecture

#### All Components as n8n Workflows:
- **Orchestrator Workflow**: Central router через Webhook triggers и HTTP Request nodes
- **Telegram Bot Workflow**: Message processing через Telegram nodes и API calls
- **Architecture Planning Workflow**: Evolution planning через OpenAI nodes и n8n API
- **Memory/Knowledge Workflow**: Search через Vector DB nodes и PostgreSQL
- **Task/Action Workflow**: CRUD operations через Database nodes и Scheduler
- **Research/Info Workflow**: RSS monitoring через Feed nodes и LLM analysis
- **Communication Workflow**: Content generation через OpenAI/Claude nodes
- **Gap Detection Workflow**: Capability analysis через Code nodes и AI
- **Workflow Generator Workflow**: Automated workflow creation через n8n API
- **Evolution Monitor Workflow**: System analysis через Analytics nodes

### Hosting & Infrastructure
- **Primary Hosting**: **Render.com**
  - Single n8n instance hosting все workflows
  - Automatic deployments от Git repository
  - Environment variables management для API keys
  - PostgreSQL addon integration с Supabase
  - Redis addon для caching (optional)
  - Webhook endpoints для external triggers
- **Database Platform**: **Supabase**
  - PostgreSQL nodes в n8n для database operations
  - Realtime subscriptions для live updates
  - Vector embeddings storage
  - Authentication management
  - File storage для documents

### AI/ML Integration (через n8n nodes)
- **Primary LLM**: OpenAI nodes (GPT-4) или Anthropic nodes (Claude)
- **Embeddings**: OpenAI Embeddings nodes для vector generation
- **Vector Storage**: Pinecone nodes или ChromaDB integration
- **AI Workflows**: Specialized AI processing через dedicated workflows

### Communication & Interface (все через n8n)
- **Primary Interface**: Telegram Bot nodes + Telegram API nodes
- **Extended Telegram**: Telegram API nodes для advanced account features
  - Access к chat history
  - Bot monitoring capabilities
  - Rich message formatting
  - File handling workflows
- **Webhook Interface**: n8n Webhook triggers для external integrations
- **API Endpoints**: HTTP Request nodes для inter-workflow communication

### Self-Evolution Infrastructure (100% n8n!)
- **Workflow Registry**: PostgreSQL nodes для workflow metadata tracking
- **n8n API Integration**: HTTP Request nodes для programmatic workflow creation
- **Evolution Database**: Supabase tables для architecture и decision tracking
- **Auto-deployment**: n8n workflows для automated Git → Render deployment
- **Monitoring**: Analytics workflows для system health и performance

### External Integrations (через n8n nodes)
- **Email**: IMAP/SMTP nodes для email processing
- **Calendar**: Google Calendar nodes, CalDAV integration
- **RSS**: RSS Feed nodes для content monitoring
- **File Processing**: File nodes + Code nodes для PDF, DOCX parsing
- **Social Media**: API nodes для различных platforms
- **Cloud Storage**: Google Drive, Dropbox nodes

## Development Environment

### n8n Setup
```bash
# Local Development
npx n8n
# или через Docker
docker run -it --rm --name n8n -p 5678:5678 n8nio/n8n

# Production на Render
# Автоматический deployment n8n instance
```

### Environment Variables (n8n Settings)
```
# Core API Keys
OPENAI_API_KEY=
ANTHROPIC_API_KEY=
TELEGRAM_BOT_TOKEN=
TELEGRAM_API_ID=
TELEGRAM_API_HASH=
SUPABASE_URL=
SUPABASE_KEY=

# Database & Cache
DATABASE_URL=postgresql://...
REDIS_URL=redis://... (optional)

# Infrastructure
RENDER_API_KEY=
N8N_WEBHOOK_BASE_URL=

# Evolution
N8N_API_KEY=              # для programmatic workflow creation
EVOLUTION_ENABLED=true    # включение/выключение эволюции

# Vector DB
PINECONE_API_KEY=
CHROMADB_URL=

# External Integrations
GOOGLE_CALENDAR_CREDENTIALS=
EMAIL_SETTINGS=
RSS_SOURCES=
```

### Ультра-минималистичная структура проекта
```
batin-agent/
├── README.md                    # Концептуальное описание проекта
├── .cursorrules                 # Memory Bank coordinator  
├── .gitignore                   # Обновлен для n8n архитектуры
├── memory-bank/                 # AI Assistant documentation
│   ├── projectbrief.md
│   ├── productContext.md
│   ├── systemPatterns.md
│   ├── techContext.md
│   ├── activeContext.md
│   └── progress.md
│
└── project/                     # Все технические файлы изолированы
    ├── workflows/               # n8n workflow JSON exports
    │   ├── core/
    │   │   ├── orchestrator.json            # Main request router
    │   │   ├── telegram-bot.json            # Telegram message handling
    │   │   └── architecture-planning.json   # Evolution planning
    │   ├── agents/
    │   │   ├── memory-knowledge.json        # Information retrieval
    │   │   ├── task-action.json            # Task management
    │   │   ├── research-info.json          # Research monitoring
    │   │   └── communication.json          # Content generation
    │   ├── evolution/
    │   │   ├── gap-detection.json          # Capability gap analysis
    │   │   ├── workflow-generator.json     # Automated workflow creation
    │   │   └── evolution-monitor.json      # System monitoring
    │   ├── integrations/
    │   │   ├── calendar-sync.json          # Calendar integration
    │   │   ├── email-processing.json       # Email handling
    │   │   ├── rss-monitoring.json        # Content monitoring
    │   │   └── file-analysis.json         # Document processing
    │   └── deployment/
    │       ├── render-deploy.json          # Deployment automation
    │       ├── backup.json                # Data backup workflows
    │       └── health-check.json          # System monitoring
    ├── scripts/                 # Deployment и utility scripts
    │   └── deploy.sh           # Automated deployment script
    ├── config/                  # Configuration files
    │   └── render.yaml         # Render deployment config
    ├── docs/                    # Technical documentation
    │   └── architecture.md    # Architecture overview
    ├── tests/                   # Testing strategies и cases
    │   └── workflow-tests.md   # Workflow testing docs
    └── .env.example            # Environment variables template
```

**Преимущества организованной структуры:**
- **Чистый root** - только README, .cursorrules, .gitignore, memory-bank
- **Изолированные технические файлы** - все в project/
- **100% workflow-based** - никакого кода, только JSON definitions
- **Ready infrastructure** - deployment scripts, config files, documentation
- **Professional organization** - enterprise-level project structure

## n8n Development Workflow

### Workflow Creation Process
1. **Design**: Create workflow в n8n GUI
2. **Test**: Debug через n8n interface
3. **Export**: Download JSON definition
4. **Version**: Commit JSON к Git repository
5. **Deploy**: Automated import в production n8n

### Workflow Dependencies
- **Inter-workflow Communication**: HTTP Request nodes между workflows
- **Shared Data**: PostgreSQL nodes для shared state
- **Event Triggers**: Webhook nodes для async communication
- **Error Handling**: Error Workflow triggers для fault tolerance

### Development Best Practices
- **Modular Design**: Each workflow handles specific domain
- **Clear Naming**: Descriptive workflow и node names
- **Error Handling**: Comprehensive error workflows
- **Documentation**: Comments в workflow nodes
- **Testing**: Dedicated test workflows для validation

## Technical Decisions

### Why 100% n8n Architecture?
- **Visual Development**: Вся логика видна и понятна
- **Rich Integration Library**: 400+ готовых nodes
- **No Code Required**: Минимум технических барьеров
- **Rapid Prototyping**: Быстрое создание MVP workflows
- **Easy Debugging**: Visual execution flow tracking
- **Self-Evolution Ready**: n8n API для programmatic workflow creation

### Why Render.com для n8n?
- **n8n-Optimized**: Готовая поддержка n8n deployments
- **Automatic Scaling**: Resource management для workflow execution
- **Environment Management**: Easy configuration через UI
- **Git Integration**: Automated deployments от repository changes
- **Database Integration**: Native PostgreSQL support
- **Webhook Support**: Reliable external triggers

### Why Supabase для Database?
- **PostgreSQL Nodes**: Native n8n integration
- **Realtime Features**: Live updates для dynamic workflows
- **Vector Storage**: Built-in support для embeddings
- **Authentication**: Ready-to-use auth workflows
- **File Storage**: Document processing workflows
- **API Layer**: REST API nodes для complex queries

### n8n Workflow Patterns

#### Request-Response Pattern
```
Telegram Webhook → Orchestrator Workflow → Specialized Workflow → Response → Telegram Send
```

#### Event-Driven Pattern
```
External Trigger → Processing Workflow → Database Update → Notification Workflow
```

#### Data Pipeline Pattern
```
Source Workflow → Transform Workflow → Storage Workflow → Analysis Workflow
```

#### Self-Evolution Pattern
```
Gap Detection → Architecture Planning → Workflow Generation → Testing → Deployment
```

## Performance & Scalability

### n8n Performance Optimization
- **Async Execution**: Non-blocking workflow execution
- **Resource Management**: Efficient node execution
- **Batch Processing**: Multiple items processing
- **Caching Strategy**: Redis nodes для frequent data
- **Queue Management**: Workflow execution queues

### Monitoring & Analytics
- **Execution Metrics**: Built-in n8n dashboard
- **Custom Analytics**: Analytics workflows для usage tracking
- **Error Tracking**: Error notification workflows
- **Performance Monitoring**: System health workflows
- **Evolution Metrics**: Custom evolution analytics

### Backup & Recovery
- **Workflow Backup**: JSON exports в Git
- **Database Backup**: Automated Supabase backups
- **Configuration Backup**: Environment settings export
- **Recovery Workflows**: Automated restoration procedures

## Security & Privacy

### n8n Security
- **Credential Management**: Secure API key storage
- **Webhook Security**: Token-based authentication
- **Environment Isolation**: Separate development/production
- **Access Control**: n8n user management
- **Audit Logging**: Execution history tracking

### Data Privacy
- **Local Processing**: Minimize external API calls
- **Encryption**: Database encryption at rest
- **Secure Transmission**: HTTPS для all communications
- **Data Retention**: Configurable data lifecycle
- **Privacy Controls**: User data management workflows

### Evolution Security
- **Workflow Validation**: Automated security checks
- **Sandbox Testing**: Isolated workflow testing
- **Rollback Capability**: Quick workflow reversion
- **Permission System**: Controlled evolution access
- **Change Tracking**: Full audit trail для system changes

## Migration & Deployment

### From Development to Production
1. **Local Testing**: n8n local instance validation
2. **JSON Export**: Workflow definition extraction
3. **Git Commit**: Version control tracking
4. **Automated Import**: Render deployment trigger
5. **Health Check**: Automated validation workflows

### Continuous Integration
- **Git Webhooks**: Automated deployment triggers
- **Workflow Testing**: Automated validation workflows
- **Environment Sync**: Configuration management
- **Rollback Strategy**: Previous version restoration
- **Monitoring**: Post-deployment health checks

### Self-Evolution Pipeline
- **Gap Detection**: Automated capability analysis
- **Architecture Planning**: AI-driven workflow design
- **JSON Generation**: Automated workflow creation
- **Testing Pipeline**: Validation workflow execution
- **Production Deployment**: Automated rollout
- **Monitoring**: Evolution success tracking

## Current Technical Status

**Infrastructure**: Ready для n8n deployment на Render
**Development Environment**: n8n local setup required
**Database**: Supabase configuration pending
**API Keys**: Environment variables setup needed
**Workflows**: JSON templates ready для implementation

**Next Technical Steps**:
1. Render n8n instance setup
2. Supabase database schema creation
3. Core workflow implementation
4. Evolution workflow development
5. Testing и validation pipeline 