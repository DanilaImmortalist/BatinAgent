# System Patterns: Batin AI Assistant

## Архитектурные принципы

### 1. Workflow-Orchestrator Pattern
```
User Request → Orchestrator Workflow → Specialized Workflow → Response → Orchestrator Workflow → User
```

**Ключевые особенности:**
- Единая точка входа (Orchestrator Workflow)
- Специализированные workflows для разных типов задач
- Контекстно-зависимое роутирование через HTTP Request nodes
- Агрегация результатов через Code nodes

### 2. Self-Evolution Workflow Pattern (НОВОЕ!)
```
Request → Workflow → Missing Capability → Gap Detection Workflow → Architecture Planning Workflow → Workflow Creation → Integration
```

**Ключевые особенности:**
- Автоматическая детекция недостающих workflows
- Workflow-based архитектурное планирование
- Создание новых workflows через n8n API
- Автоматическая интеграция через deployment workflows

### 3. Memory-Augmented Workflow Architecture
- Персональная база знаний как shared Supabase nodes
- Vector embeddings через Pinecone/ChromaDB nodes
- Contextual memory через persistent workflow variables
- Historical context через database lookups
- **НОВОЕ**: Workflow Knowledge Base для системного саморазвития

### 4. Microworkflows with Shared State + Evolution Registry
```
[Telegram Webhook] → [Orchestrator Workflow] → [Memory Workflow]
                                             → [Task Workflow]
                                             → [Research Workflow]
                                             → [Architecture Workflow]
                                             → [Shared Database Nodes]
                                             → [Evolution Registry Workflow]
```

## n8n Workflow Architecture

### Core Workflows

#### Orchestrator Workflow
- **Роль**: Master coordinator + Evolution Detector + Workflow Router
- **n8n Nodes**:
  - Webhook Trigger для Telegram requests
  - Switch nodes для request classification
  - HTTP Request nodes для вызова других workflows
  - Code nodes для response aggregation
  - **НОВОЕ**: Function nodes для missing workflow detection
  - **НОВОЕ**: HTTP Request к Architecture Planning Workflow
- **Паттерн**: Router + Aggregator + Observer + Evolution Trigger

#### Architecture Planning Workflow
- **Роль**: System evolution planner через n8n
- **n8n Nodes**:
  - Manual Trigger для evolution requests
  - OpenAI nodes для architecture analysis
  - **n8n API nodes** для workflow creation
  - PostgreSQL nodes для evolution tracking
  - Code nodes для workflow generation logic
  - HTTP Request nodes для integration testing
- **Паттерн**: Architect + Planner + Workflow Generator

### Specialized Agent Workflows

#### Memory/Knowledge Workflow
- **Роль**: Information retrieval and storage
- **n8n Nodes**:
  - HTTP Request trigger от Orchestrator
  - Vector Store nodes (Pinecone/ChromaDB)
  - File nodes для document processing
  - OpenAI nodes для semantic search
  - PostgreSQL nodes для metadata storage
  - **НОВОЕ**: Self-indexing через automated triggers
- **Паттерн**: Search + Index + Context Retrieval

#### Task/Action Workflow
- **Роль**: Task management and execution
- **n8n Nodes**:
  - HTTP Request trigger от Orchestrator
  - PostgreSQL nodes для CRUD operations
  - Cron triggers для scheduled tasks
  - Google Calendar nodes для calendar integration
  - Email nodes для notifications
  - **НОВОЕ**: Development task management nodes
- **Паттерн**: CRUD + Schedule + Notify

#### Research/Info Workflow
- **Роль**: Information monitoring and analysis
- **n8n Nodes**:
  - RSS Feed triggers для автоматического мониторинга
  - HTTP Request nodes для API calls
  - OpenAI nodes для content summarization
  - Code nodes для trend analysis
  - PostgreSQL nodes для data storage
  - **НОВОЕ**: New source discovery через web scraping
- **Паттерн**: Monitor + Analyze + Summarize

#### Communication Workflow
- **Роль**: Content generation and communication
- **n8n Nodes**:
  - HTTP Request trigger от Orchestrator
  - OpenAI/Claude nodes для text generation
  - Template nodes для style adaptation
  - Multiple API nodes (Telegram, Email, социальные сети)
  - **НОВОЕ**: Multi-channel posting automation
- **Паттерн**: Generate + Format + Distribute

#### Telegram Bot Workflow
- **Роль**: Primary user interface
- **n8n Nodes**:
  - Telegram Trigger для incoming messages
  - HTTP Request nodes к Orchestrator Workflow
  - Telegram nodes для response sending
  - **НОВОЕ**: Telegram API nodes для extended account
  - Code nodes для message formatting
  - File nodes для media handling
- **Паттерн**: Interface + Route + Format

### Evolution Workflows (Hybrid)

#### Gap Detection Workflow
- **Роль**: Capability gap detector
- **n8n Nodes**:
  - Cron triggers для periodic analysis
  - PostgreSQL nodes для request pattern analysis
  - OpenAI nodes для capability gap identification
  - **HTTP Request к n8n API** для workflow inventory
  - Code nodes для priority assessment
  - Webhook nodes для evolution triggers
- **Паттерн**: Observer + Analyzer + Trigger

#### Workflow Generator Workflow
- **Роль**: Automated workflow creator
- **n8n Nodes**:
  - HTTP Request trigger от Architecture Planning
  - OpenAI nodes для workflow logic generation
  - **n8n API nodes** для programmatic workflow creation
  - Code nodes для JSON workflow definition
  - File nodes для workflow export
  - PostgreSQL nodes для registry updates
- **Паттерн**: Generate + Create + Register

#### Evolution Monitor Workflow
- **Роль**: System evolution analyst
- **n8n Nodes**:
  - Cron triggers для regular monitoring
  - **n8n API nodes** для workflow metrics
  - PostgreSQL nodes для usage analytics
  - OpenAI nodes для optimization suggestions
  - Dashboard integration nodes
  - Alert nodes для critical issues
- **Паттерн**: Monitor + Analyze + Optimize

## Self-Evolution Data Flow Patterns (НОВОЕ!)

### 1. Evolution Detection Flow
```
User Request → Workflow Processing → Capability Check → Gap Detection Workflow → Evolution Trigger
```

### 2. Architecture Planning Flow
```
Evolution Trigger → Architecture Planning Workflow → Analysis → Design → Implementation Plan → Workflow Creation
```

### 3. Workflow Development Flow
```
Development Request → Workflow Generator → JSON Creation → n8n API Import → Testing → Registry Update → Monitoring
```

### 4. Continuous Evolution Flow
```
Usage Monitoring → Pattern Analysis → Optimization Suggestions → User Approval → Implementation
```

## n8n Workflow Data Flow Patterns

### 1. Request Processing Flow
```
Telegram Input → Intent Recognition → Workflow Selection → Task Execution → Response Formatting
```

### 2. Memory Integration Flow
```
New Information → Embedding Generation → Vector Storage → Context Retrieval → Response Enhancement
```

### 3. Proactive Monitoring Flow
```
External Sources → Content Analysis → Relevance Filtering → User Notification
```

## n8n State Management

### Shared Database Layer
- **User Profile**: PostgreSQL nodes для preferences, history, context
- **Knowledge Base**: Vector DB nodes для documents, notes, correspondence
- **Task State**: PostgreSQL nodes для current tasks, reminders, schedule
- **Conversation Context**: Workflow variables для recent interactions
- **НОВОЕ**: Workflow Registry: PostgreSQL tables для workflow metadata

### Evolution Registry (НОВОЕ!)
- **Workflow Registry**: PostgreSQL tables с workflow definitions и capabilities
- **Evolution History**: Database tracking past developments и decisions
- **Development Queue**: Task tables для planned workflows и priorities
- **Architecture Knowledge**: Vector embeddings для design patterns

### Workflow Variable Management
- Stateless workflows with shared persistent database
- Context injection через HTTP Request parameters
- Session continuity через Orchestrator Workflow variables
- **НОВОЕ**: Evolution context preservation через dedicated tables

## Self-Evolution n8n Patterns (НОВОЕ!)

### Workflow Creation Pattern
```
Gap Detection → Architecture Planning → JSON Generation → n8n API Call → Workflow Import → Testing → Registry Update
```

**n8n Implementation:**
- **Detection**: Code nodes analyze request patterns
- **Planning**: OpenAI nodes generate workflow architecture
- **Creation**: n8n API nodes create actual workflows
- **Testing**: HTTP Request nodes validate new workflows
- **Integration**: Database nodes update workflow registry

### Workflow Optimization Pattern
```
Usage Analysis → Performance Metrics → Optimization Suggestions → User Approval → Workflow Updates
```

**n8n Implementation:**
- **Analysis**: Analytics nodes track workflow performance
- **Metrics**: Database queries analyze efficiency
- **Suggestions**: OpenAI nodes suggest improvements
- **Updates**: n8n API nodes modify existing workflows

### Dependency Management Pattern
```
Workflow A → Required Capability → Check Registry → Workflow B Available? → Route or Create
```

**n8n Implementation:**
- **Check**: Database lookup nodes verify capabilities
- **Route**: Switch nodes direct to existing workflows
- **Create**: Architecture Planning Workflow creates missing dependencies

## n8n Integration Patterns

### API Integration Pattern
- **External APIs**: HTTP Request nodes для third-party services
- **Authentication**: Credential stores в n8n settings
- **Rate Limiting**: Wait nodes и retry logic
- **Error Handling**: Error Workflow triggers

### Database Integration Pattern
- **Primary DB**: PostgreSQL nodes для Supabase connection
- **Vector DB**: Pinecone/ChromaDB nodes для embeddings
- **Cache**: Redis nodes для temporary data (optional)
- **Backup**: Scheduled workflows для data backup

### Communication Integration Pattern
- **Telegram**: Multiple Telegram nodes (Bot API + Account API)
- **Email**: IMAP/SMTP nodes для email processing
- **Calendar**: Google Calendar nodes для scheduling
- **RSS/News**: RSS Reader nodes для monitoring

## n8n Workflow Deployment Patterns

### Version Control Pattern
- **Export**: n8n workflows → JSON files
- **Storage**: JSON files в Git repository
- **Import**: Automated import через n8n API
- **Versioning**: Git tags для workflow versions

### Environment Management Pattern
- **Development**: Local n8n instance для testing
- **Staging**: Render staging environment
- **Production**: Render production n8n instance
- **Migration**: Automated deployment workflows

### Monitoring Pattern
- **Health Checks**: Ping workflows для system health
- **Performance**: Execution time tracking
- **Errors**: Error notification workflows
- **Usage**: Analytics workflows для user behavior

## n8n Node Selection Guidelines

### Core Node Types:
- **Triggers**: Webhook, Cron, Manual, RSS, Email
- **Logic**: Switch, If, Code, Function, Merge
- **Data**: PostgreSQL, HTTP Request, File, JSON
- **AI/ML**: OpenAI, Claude, Vector Store, Embeddings
- **Communication**: Telegram, Email, Slack, Discord
- **Utilities**: Wait, Stop and Error, Set, DateTime

### Specialized Integrations:
- **Calendar**: Google Calendar, CalDAV
- **Files**: Google Drive, Dropbox, S3
- **Analytics**: Google Analytics, Mixpanel
- **Social**: Twitter, LinkedIn, Facebook
- **Development**: GitHub, GitLab, n8n API

### Evolution-Specific Nodes:
- **n8n API**: Workflow creation и management
- **Vector DB**: Pinecone, ChromaDB, Weaviate
- **Code Generation**: OpenAI для workflow logic
- **Testing**: HTTP Request для validation
- **Registry**: PostgreSQL для workflow tracking 