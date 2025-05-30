# Active Context: Batin AI Assistant

## Текущий фокус

**🏗️ АРХИТЕКТУРНОЕ ПЛАНИРОВАНИЕ**: Проектирование 100% n8n workflows self-evolving системы

## Архитектурная эволюция

### ✅ Финальный подход: 100% n8n Workflows
После обсуждения с Батином - ВСЕ компоненты реализуются как n8n workflows:
- **Orchestrator Workflow**: Центральный роутер через Webhook triggers
- **Telegram Bot Workflow**: Message processing через Telegram nodes  
- **Architecture Planning Workflow**: Evolution planning через OpenAI nodes
- **System Architect**: Полностью в n8n через AI nodes и n8n API

### ❌ Убрано: Python координация
- Никаких Python компонентов
- Только n8n workflows + JSON exports
- Visual development без программирования
- Programmatic workflow creation через n8n API

## Архитектурные вопросы для обсуждения

### 1. Self-Evolution n8n Механизм
**Как workflow будет создавать другие workflows?**
- Gap Detection Workflow → анализирует недостающие возможности
- Architecture Planning Workflow → проектирует новые workflows через OpenAI
- Workflow Generator Workflow → создает JSON definitions через n8n API
- Automated Import → загружает новые workflows в production

### 2. n8n API Integration Strategy
**Как реализовать programmatic workflow creation?**
- HTTP Request nodes к n8n API для workflow CRUD
- Code nodes для JSON workflow definition generation
- Testing workflows для validation новых workflows
- Registry workflows для tracking всех workflows

### 3. Workflow Communication Patterns
**Как workflows будут общаться между собой?**
- HTTP Request nodes для inter-workflow communication
- Webhook triggers для async messaging
- Shared PostgreSQL nodes для state management
- Queue systems через database tables

### 4. Evolution Control & Security
**Как контролировать автоматическое создание workflows?**
- User approval workflows для critical changes
- Sandbox testing workflows перед production
- Rollback workflows для проблемных updates
- Permission workflows для evolution access

## Ключевые архитектурные решения

### 1. 100% Visual Development Pattern
```
User Request → Telegram Webhook → Orchestrator Workflow → Specialized Workflow → Response → User
```

**Преимущества:**
- Полная визуализация системной логики
- No-code development approach
- Rapid prototyping через GUI
- Built-in debugging и monitoring

**Вызовы:**
- Complex logic в Code nodes
- Workflow dependency management
- Version control через JSON exports
- Testing strategies для visual workflows

### 2. Организованная структура проекта (ОБНОВЛЕНО!)
```
batin-agent/
├── README.md                    # Концептуальное описание проекта
├── .cursorrules                 # Memory Bank coordinator  
├── .gitignore                   # Обновлен для n8n архитектуры
├── memory-bank/                 # AI assistant documentation
└── project/                     # Все технические файлы изолированы
    ├── workflows/               # n8n workflow JSON exports
    │   ├── core/                # Основные системные workflows
    │   ├── agents/              # Specialized agent workflows
    │   ├── evolution/           # Self-evolution workflows
    │   ├── integrations/        # External service workflows
    │   └── deployment/          # Deployment automation workflows
    ├── scripts/                 # Deployment и utility scripts
    ├── config/                  # Configuration files
    ├── docs/                    # Technical documentation
    ├── tests/                   # Testing strategies и cases
    └── .env.example            # Environment variables template
```

**Принципы:**
- **Чистый root** - только README, .cursorrules, .gitignore, memory-bank
- **Изолированные технические файлы** - все в project/ для организации
- **100% workflow-based** - никакого кода, только JSON definitions
- **Ready infrastructure** - deployment scripts, config files, documentation
- **Professional organization** - enterprise-level project structure

### 3. Self-Evolution через n8n API
**Процесс создания новых workflows:**
1. **Gap Detection**: Cron workflow анализирует usage patterns
2. **Architecture Planning**: AI workflow проектирует решение
3. **JSON Generation**: Code workflow создает workflow definition
4. **API Creation**: HTTP Request workflow создает новый workflow в n8n
5. **Testing**: Validation workflow проверяет функциональность
6. **Registry Update**: Database workflow обновляет workflow registry

## n8n Технологические решения

### Core Platform (обновлено)
- **Single Platform**: n8n hosted на Render.com
- **Development**: 100% visual workflow creation
- **Database**: Supabase через PostgreSQL nodes
- **AI Integration**: OpenAI/Claude nodes для intelligence
- **Communication**: Telegram nodes + API nodes

### Self-Evolution Stack (обновлено)
- **Workflow Registry**: PostgreSQL tables через Database nodes
- **Architecture KB**: Vector embeddings через AI nodes
- **Evolution Pipeline**: HTTP Request nodes к n8n API
- **Monitoring**: Analytics workflows для tracking

## Immediate Tasks

### 1. n8n Architecture Planning (сейчас)
- [ ] Design core workflow communication patterns
- [ ] Plan n8n API integration для workflow creation
- [ ] Design evolution workflow dependencies
- [ ] Plan Render n8n instance configuration

### 2. Workflow Structure Design
- [ ] Define JSON export/import strategy
- [ ] Plan inter-workflow communication protocols
- [ ] Design shared state management через DB
- [ ] Evolution workflow security patterns

### 3. Infrastructure Setup (после планирования)
- [ ] Render n8n instance deployment
- [ ] Supabase database schema для workflow registry
- [ ] Core workflow implementations
- [ ] Evolution workflow development

## Ключевые вопросы для Батина

### n8n Development Approach
1. **Local Development**: Нужен ли local n8n instance для разработки?
2. **Workflow Testing**: Как тестировать workflows перед production?
3. **Version Control**: Git strategy для JSON workflow exports?

### Evolution Control
4. **Automation Level**: Какой уровень автономности для workflow creation?
5. **User Approval**: Когда требуется explicit approval для новых workflows?
6. **Security Boundaries**: Какие ограничения на automated workflow generation?

### Infrastructure Preferences
7. **Render Configuration**: Specific requirements для n8n instance?
8. **Database Schema**: Preferred structure для workflow registry?
9. **Monitoring Approach**: Built-in n8n monitoring vs custom analytics workflows?

## Success Metrics для Architecture Phase

### Architectural Clarity
- [ ] Clear n8n workflow communication patterns
- [ ] Defined self-evolution через n8n API process
- [ ] Workflow creation/integration methodology
- [ ] Infrastructure deployment plan

### Technical Readiness
- [ ] n8n workflow structure finalized
- [ ] Evolution workflow architecture designed
- [ ] Render deployment strategy confirmed
- [ ] Security/privacy considerations addressed

### Stakeholder Alignment
- [ ] Батин approval на 100% n8n approach
- [ ] Clear understanding of evolution automation level
- [ ] Infrastructure setup confirmed
- [ ] Development workflow agreed

## После архитектурного планирования

### Phase 1: Foundation Workflows (1-2 недели)
- Core infrastructure workflows (Orchestrator, Telegram Bot)
- Basic workflow registry system
- Simple evolution detection workflow
- n8n API integration workflow

### Phase 2: Self-Evolution Workflows (2-3 недели)
- Architecture Planning Workflow с AI
- Workflow Generator с n8n API integration
- Automated testing workflows
- Evolution monitoring workflows

### Phase 3: Full Evolution Pipeline (1-2 недели)
- End-to-end workflow creation pipeline
- User interaction workflows для approvals
- Monitoring и optimization workflows
- Production deployment automation

## Текущий статус

**🎯 Фокус:** 100% n8n Workflows Architecture Design ✅  
**⏳ Следующее:** Workflow communication patterns и n8n API integration strategy  
**🚫 Блокер:** Нужно согласование evolution automation level и workflow creation approach

### ✅ Недавние обновления:
- **Архитектура**: Полный переход на n8n workflows, убраны все Python компоненты
- **Структура проекта**: Создана правильная организация с project/ folder
- **Инфраструктура**: Добавлены deployment scripts, config files, documentation
- **Memory Bank**: Обновлены все файлы для отражения n8n-centric подхода
- **Документация**: .cursorrules обновлен для visual development focus
- **Environment Setup**: Создан .env.example template для n8n configuration 