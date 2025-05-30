# Project Brief: Batin Personal AI Assistant

## Общее описание

Персональный "умный ассистент" для Батина - **self-evolving мультиагентная система**, построенная полностью на **n8n workflows**. Система автоматизирует рутину, усиливает производительность, помогает с анализом информации, коммуникациями, задачами, поиском и организацией знаний. Система способна к саморазвитию и автоматическому созданию новых n8n workflows по мере необходимости.

## Ключевые принципы

### Основные
* **Единый интерфейс**: Пользователь (Батин) видит одного ассистента через Telegram
* **100% n8n Architecture**: Все компоненты реализованы как n8n workflows
* **Visual Development**: Разработка через GUI, без программирования
* **Workflow Orchestration**: Центральный n8n workflow координирует остальные

### Эволюционные (НОВОЕ!)
* **Self-Evolving Workflows**: Система сама создает новые n8n workflows по потребности
* **Workflow-as-Architecture**: Архитектурное планирование через специальный n8n workflow
* **Минималистичная структура**: Чистый корень проекта, только JSON экспорты workflows
* **Visual Evolution**: Создание новых workflows через n8n API и GUI

## Self-Evolution Механизм

### Принцип работы:
```
Запрос → Orchestrator Workflow → Workflow отсутствует → Gap Detection Workflow → Architecture Workflow → Workflow Creation → Integration → Deployment
```

### Системные n8n workflows:
- **Orchestrator Workflow**: Центральный роутер ко всем другим workflows
- **Architecture Planning Workflow**: Планирует создание новых workflows
- **Gap Detection Workflow**: Обнаруживает недостающие возможности
- **Workflow Generator**: Создает новые n8n workflows программно
- **Evolution Monitor Workflow**: Анализирует эффективность и предлагает улучшения

## Базовые workflows (MVP)

### 1. Orchestrator Workflow
- Принимает запросы от Telegram через webhook
- Определяет подходящий workflow для выполнения задачи
- **НОВОЕ**: Детектирует отсутствующие workflows и запускает Architecture Planning
- Агрегирует результаты от разных workflows

### 2. Telegram Bot Workflow
- Обрабатывает входящие сообщения через Telegram Bot API
- Форматирует ответы для пользователя
- **НОВОЕ**: Интеграция с дополнительным Telegram аккаунтом через Telegram API
- Поддержка rich-форматирования сообщений

### 3. Memory/Knowledge Workflow
- Поиск по персональному архиву через vector embeddings
- Индексация новых документов и заметок
- Генерация справок на основе контекста
- **Эволюция**: Может запросить новые типы индексации

### 4. Task/Action Workflow
- Управление задачами через Supabase database nodes
- Создание напоминаний через scheduler nodes
- **НОВОЕ**: Включает задачи по созданию новых workflows
- Интеграция с календарем через API nodes

### 5. Research/Info Workflow
- Мониторинг RSS и новостных источников
- Анализ научных публикаций через API integrations
- Генерация дайджестов через LLM nodes
- **Эволюция**: Может запросить новые источники данных

### 6. Communication Workflow
- Генерация текстов через OpenAI/Claude nodes
- Редактирование и адаптация стиля
- Составление писем, постов, сообщений
- **Эволюция**: Может запросить новые каналы коммуникации

## n8n-First Инфраструктура

### Основная платформа:
- **n8n**: Единственная платформа разработки (все workflows)
- **Supabase**: База данных (через PostgreSQL nodes)
- **Render**: Hosting n8n instance + auto-deployment
- **Telegram Bot API**: Интерфейс (через HTTP Request nodes)
- **Extended Telegram API**: Расширенные возможности (через Telegram API nodes)

### Self-Evolution инфраструктура:
- **Workflow Registry Workflow**: Реестр всех существующих workflows
- **n8n API Workflow**: Программное создание новых workflows
- **Evolution Database**: Supabase таблицы для tracking эволюции
- **Auto-deployment Workflow**: Автоматическое развертывание через Render API

## Пользовательский опыт

### Обычные запросы:
- "Сделай дайджест новостей по longevity" → Research Workflow
- "Что я писал по теме deathism?" → Memory Workflow  
- "Напомни о звонке с Иваном" → Task Workflow
- "Подготовь черновик письма" → Communication Workflow
- "Покажи задачи на неделю" → Task Workflow

### Эволюционные взаимодействия (НОВОЕ!):
- Система: "Обнаружил потребность в Calendar Integration Workflow. Создать?"
- Система: "Предлагаю добавить Scientific Papers Monitoring Workflow. Одобряешь?"
- Пользователь: "Добавь возможность анализа PDF файлов"
- Система: "Создаю PDF Analysis Workflow... Готов к тестированию"

## Организованная структура проекта

```
batin-agent/
├── README.md                    # Концептуальное описание проекта
├── .cursorrules                 # Memory Bank coordinator  
├── .gitignore                   # Обновлен для n8n архитектуры
├── memory-bank/                 # AI assistant documentation
└── project/                     # Все технические файлы изолированы
    ├── workflows/               # n8n workflow JSON exports
    │   ├── core/
    │   │   ├── orchestrator.json            # Центральный роутер
    │   │   ├── telegram-bot.json            # Telegram обработка
    │   │   └── architecture-planning.json   # Планирование эволюции
    │   ├── agents/
    │   │   ├── memory-knowledge.json        # Поиск по базе знаний
    │   │   ├── task-action.json            # Управление задачами
    │   │   ├── research-info.json          # Мониторинг информации
    │   │   └── communication.json          # Генерация контента
    │   ├── evolution/
    │   │   ├── gap-detection.json          # Обнаружение пробелов
    │   │   ├── workflow-generator.json     # Создание workflows
    │   │   └── evolution-monitor.json      # Мониторинг эволюции
    │   ├── integrations/                   # Интеграционные workflows
    │   │   ├── calendar-sync.json
    │   │   ├── email-processing.json
    │   │   └── pdf-analysis.json
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

## Эволюционные цели

### Краткосрочные (1-2 месяца):
- Базовые n8n workflows для всех агентов
- Workflow-based gap detection
- Architecture Planning Workflow
- Автоматическое создание простых workflows

### Среднесрочные (3-6 месяцев):
- Программная генерация сложных workflows через n8n API
- AI-driven workflow optimization
- Continuous evolution pipeline полностью в n8n
- Advanced workflow registry и dependencies

### Долгосрочные (6+ месяцев):
- Полуавтономное создание новых workflow типов
- Self-optimization n8n workflows
- Predictive workflow creation
- Community-driven workflow library

## Технологические преимущества n8n-First

### Разработка:
- **Visual Development**: Вся логика видна в GUI
- **Rich Integrations**: 400+ готовых nodes для интеграций
- **No Code Required**: Минимум программирования
- **Easy Debugging**: Визуальная отладка workflows

### Эволюция:
- **Workflow-as-Code**: JSON экспорт/импорт workflows
- **Programmatic Creation**: n8n API для создания workflows
- **Version Control**: Git-based workflow management
- **Rapid Prototyping**: Быстрое создание MVP workflows

### Масштабирование:
- **Modular Architecture**: Каждый workflow независим
- **Easy Deployment**: Один n8n instance, множество workflows
- **Resource Efficiency**: Shared execution environment
- **Monitoring Built-in**: n8n dashboard для всех workflows

## Статус проекта

**Текущая фаза**: Архитектурное планирование 100% n8n workflows
**Приоритет**: Workflow design patterns, n8n API integration patterns
**Следующие шаги**: Создание базовых workflows, настройка n8n instance на Render 