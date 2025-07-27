# 📖 Example: React SaaS Dashboard Setup

This example shows ProjectSetupContext setting up a React-based SaaS dashboard.

## Project Request

"I need to build a React dashboard for a SaaS product. It should use TypeScript, Material-UI, React Query for data fetching, and include authentication, real-time notifications, and data visualization."

## What Gets Created

### 1. PRD.md (Customized for SaaS)
```markdown
# 📄 Product Requirements Document (PRD)

**Project Name**: InsightDash  
**Version**: 1.0  
**Date**: 2024-01-20  
**Status**: Approved  

## 📋 Executive Summary

### Problem Statement
SaaS businesses need comprehensive dashboards to track metrics, manage users, and visualize data. Current solutions are either too generic or require extensive customization.

### Solution Overview
InsightDash provides a customizable, real-time dashboard platform with built-in authentication, flexible data visualization, and a modern React-based UI.

### Key Benefits
- Real-time data updates via WebSocket
- Customizable widgets and layouts
- Enterprise-ready authentication
- Mobile-responsive design
```

### 2. Project Structure
```
insight-dash/
├── src/
│   ├── components/
│   │   ├── common/
│   │   ├── dashboard/
│   │   ├── charts/
│   │   └── layout/
│   ├── features/
│   │   ├── auth/
│   │   ├── analytics/
│   │   ├── notifications/
│   │   └── settings/
│   ├── hooks/
│   │   ├── useAuth.ts
│   │   ├── useRealtime.ts
│   │   └── useAnalytics.ts
│   ├── services/
│   │   ├── api.service.ts
│   │   ├── auth.service.ts
│   │   └── websocket.service.ts
│   ├── stores/
│   │   └── app.store.ts
│   ├── styles/
│   │   ├── theme.ts
│   │   └── global.css
│   └── utils/
├── public/
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
└── [config files]
```

### 3. Implementation_Cadence.md Sessions
```markdown
### Session 1.1: Authentication & Routing
**Context Window**: ~2500 tokens
**Prerequisites**: Phase 0 complete
**Duration**: 2-3 hours

- [ ] Set up React Router with protected routes
- [ ] Implement JWT authentication flow
- [ ] Create login/signup components
- [ ] Add auth context/hooks
- [ ] Set up axios interceptors
- [ ] Create user profile store
- [ ] Add remember me functionality
- [ ] Implement logout flow
- [ ] Write auth service tests
- [ ] Add loading states
- [ ] **Checkpoint**: Can login and access protected routes

### Session 1.2: Dashboard Layout & Navigation
**Context Window**: ~2500 tokens
**Prerequisites**: Session 1.1 complete
**Duration**: 2-3 hours

- [ ] Create responsive app shell
- [ ] Implement sidebar navigation
- [ ] Add top navigation bar
- [ ] Create breadcrumb system
- [ ] Add theme switching
- [ ] Implement layout persistence
- [ ] Create widget grid system
- [ ] Add drag-and-drop support
- [ ] Write layout tests
- [ ] **Checkpoint**: Full responsive layout working
```

### 4. Tech-Specific Files

**package.json**
```json
{
  "name": "insight-dash",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "start": "vite",
    "build": "tsc && vite build",
    "test": "vitest",
    "lint": "eslint src/",
    "storybook": "storybook dev -p 6006"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "@mui/material": "^5.14.0",
    "@tanstack/react-query": "^5.0.0",
    "react-router-dom": "^6.15.0",
    "axios": "^1.5.0",
    "recharts": "^2.8.0",
    "socket.io-client": "^4.5.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.0",
    "typescript": "^5.2.0",
    "vite": "^4.4.0",
    "@vitejs/plugin-react": "^4.0.0",
    "vitest": "^0.34.0",
    "@storybook/react-vite": "^7.4.0"
  }
}
```

**tsconfig.json**
```json
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@components/*": ["src/components/*"],
      "@features/*": ["src/features/*"]
    }
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
```

### 5. CLAUDE.md (React-Specific)
```markdown
# 🧠 InsightDash - AI Context & Session Management

## 🎯 Project Overview
**What**: React-based SaaS dashboard with real-time updates  
**Core Feature**: Customizable analytics dashboard with drag-drop widgets  
**Tech Stack**: React 18, TypeScript, Material-UI, React Query, Vite  
**Status**: Phase 0 - Foundation (0%)

## 📍 Current State (Updated: 2024-01-20)

### 🏗️ Architecture Summary
- **Build Tool**: Vite for fast HMR
- **State Management**: React Query + Context
- **Styling**: Material-UI + Emotion
- **Testing**: Vitest + React Testing Library
- **Real-time**: Socket.io client

### 🔑 Key Design Decisions
1. **Component Architecture**: Feature-based organization
2. **Data Fetching**: React Query for server state
3. **Authentication**: JWT with refresh tokens
4. **Styling**: Material-UI theme customization
5. **Build**: Vite for development speed
```

## Benefits Demonstrated

1. **React-Specific Setup**: Vite, React Query, proper typing
2. **SaaS Patterns**: Auth, real-time, multi-tenant ready
3. **Modern Stack**: Latest React 18 features utilized
4. **Testing Ready**: Vitest configured from start
5. **Developer Experience**: Fast HMR, path aliases

## Time Comparison

- **Manual React Setup**: 3-5 hours (so many decisions!)
- **With ProjectSetupContext**: 20 minutes
- **Benefit**: Start building features immediately

---

*This example shows how ProjectSetupContext adapts to different project types while maintaining quality and consistency.*