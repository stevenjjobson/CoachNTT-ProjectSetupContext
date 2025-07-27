# 📖 Example: Task Management API Setup

This example shows how the ProjectSetupContext system sets up a real project.

## Project Request

"I need to build a task management API using TypeScript, Express, and GraphQL. It should support user authentication, task CRUD operations, and real-time updates."

## What Gets Created

### 1. PRD.md (Customized)
```markdown
# 📄 Product Requirements Document (PRD)

**Project Name**: TaskFlow API  
**Version**: 1.0  
**Date**: 2024-01-20  
**Status**: Approved  

## 📋 Executive Summary

### Problem Statement
Teams struggle to track tasks across projects with existing tools being either too complex or too simple. We need a flexible API that applications can build upon.

### Solution Overview  
TaskFlow API provides a GraphQL-based task management backend with real-time updates, multi-project support, and flexible authentication.

### Key Benefits
- Simple integration via GraphQL
- Real-time updates via subscriptions
- Flexible permission system
```

### 2. CLAUDE.md (Customized)
```markdown
# 🧠 TaskFlow API - AI Context & Session Management

## 🎯 Project Overview
**What**: GraphQL API for task management with real-time updates  
**Core Feature**: Multi-project task tracking with team collaboration  
**Tech Stack**: TypeScript, Express, Apollo Server, PostgreSQL, Redis  
**Status**: Phase 0 - Foundation (0%)

## 📍 Current State (Updated: 2024-01-20)

### ✅ Completed Sessions
- **Session 0.0**: Project Setup
  - Initialized repository
  - Set up TypeScript configuration
  - Created project structure
  - Configured development workflow

### 🏗️ Architecture Summary
```
src/
├── graphql/
│   ├── schema/
│   ├── resolvers/
│   └── dataloaders/
├── services/
├── models/
└── utils/
```
```

### 3. Implementation_Cadence.md (Customized Sessions)
```markdown
## 🏗️ Phase 1: Core Features (Weeks 2-3)

### Session 1.1: User Authentication
**Context Window**: ~2500 tokens
**Prerequisites**: Phase 0 complete
**Duration**: 2-3 hours

- [ ] Design user model and auth strategy
- [ ] Implement JWT authentication
- [ ] Create login/signup mutations
- [ ] Add auth middleware
- [ ] Write auth service tests
- [ ] Create user GraphQL schema
- [ ] Implement password hashing
- [ ] Add refresh token support
- [ ] Document auth flow
- [ ] Create auth integration tests
- [ ] **Checkpoint**: Can login and receive JWT

### Session 1.2: Task CRUD Operations  
**Context Window**: ~2500 tokens
**Prerequisites**: Session 1.1 complete
**Duration**: 2-3 hours

- [ ] Design task model
- [ ] Create task GraphQL schema
- [ ] Implement task mutations (create/update/delete)
- [ ] Add task queries with filtering
- [ ] Create task service layer
- [ ] Add permission checks
- [ ] Implement task validation
- [ ] Write comprehensive tests
- [ ] Add DataLoader for performance
- [ ] **Checkpoint**: Full task CRUD working
```

### 4. Project Structure
```
taskflow-api/
├── src/
│   ├── graphql/
│   │   ├── schema/
│   │   │   ├── index.graphql
│   │   │   ├── user.graphql
│   │   │   └── task.graphql
│   │   ├── resolvers/
│   │   │   ├── index.ts
│   │   │   ├── user.resolver.ts
│   │   │   └── task.resolver.ts
│   │   └── dataloaders/
│   │       └── user.loader.ts
│   ├── services/
│   │   ├── auth.service.ts
│   │   └── task.service.ts
│   ├── models/
│   │   ├── user.model.ts
│   │   └── task.model.ts
│   ├── middleware/
│   │   └── auth.middleware.ts
│   └── utils/
│       ├── database.ts
│       └── logger.ts
├── tests/
│   ├── unit/
│   ├── integration/
│   └── graphql/
├── scripts/
│   ├── optimize_context.py
│   └── scaffold_graphql.py
├── .env.example
├── .gitignore
├── Makefile
├── package.json
├── tsconfig.json
├── CLAUDE.md
├── Implementation_Cadence.md
├── SESSION_LOG.md
├── GRAPHQL_CONVENTIONS.md
└── verify_setup.py
```

### 5. Makefile (Project-Specific)
```makefile
PROJECT_NAME := taskflow-api
NODE := node
NPM := npm

# ... standard commands ...

# Project-specific commands
.PHONY: db-migrate
db-migrate:
	@echo "Running database migrations..."
	@$(NPM) run migrate

.PHONY: db-seed
db-seed:
	@echo "Seeding database..."
	@$(NPM) run seed

.PHONY: redis-start
redis-start:
	@echo "Starting Redis..."
	@docker run -d -p 6379:6379 --name taskflow-redis redis:alpine
```

### 6. First Session Ready

```markdown
## Session 0.1: Project Foundation & Core Principles

Ready to start! Your context:

@CLAUDE.md
@Implementation_Cadence.md (lines 50-120 for Session 0.1)
@verify_setup.py

The session will set up:
- Express server with TypeScript
- Apollo Server integration  
- Basic health check endpoint
- Test infrastructure
- Database connection
- Logging system
```

## Benefits Demonstrated

1. **Clear Roadmap**: Every session has specific goals
2. **Tech-Specific**: Customized for GraphQL/TypeScript
3. **Best Practices**: Testing, DataLoaders, auth built-in
4. **Context Optimized**: Each session stays under 3000 tokens
5. **Progressive**: Builds complexity incrementally

## Time Saved

- **Manual Setup**: 2-4 hours of decisions and setup
- **With Templates**: 15 minutes to working project
- **Context Efficiency**: 50% less token usage
- **Consistency**: Same patterns throughout project

---

*This example shows how ProjectSetupContext transforms a simple request into a complete, production-ready project structure.*