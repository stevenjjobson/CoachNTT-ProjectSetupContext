# ✅ Project Setup Checklist

## 🚀 Quick Setup (15 minutes)

### 1. Initial Information Gathering
- [ ] Project name defined
- [ ] Tech stack chosen
- [ ] Key features listed (3-5)
- [ ] PRD created or provided
- [ ] Target environment identified

### 2. Copy Templates
```bash
# Quick copy all templates
cp -r ProjectSetupContext/templates/* .

# Or selective copy
cp ProjectSetupContext/templates/core/* .
cp ProjectSetupContext/templates/efficiency/* scripts/
```

### 3. Essential Customizations
- [ ] Replace all [PROJECT_NAME] placeholders
- [ ] Update tech stack in CLAUDE.md
- [ ] Set Python version in verify_setup.py
- [ ] Customize .gitignore for tech stack
- [ ] Update Makefile commands

### 4. Create Structure
```bash
# One command to create all directories
mkdir -p src/{core,services,utils,interfaces} \
         tests/{unit,integration,e2e} \
         docs/{api,architecture,guides} \
         scripts \
         .github/workflows
```

### 5. Initialize Project
```bash
git init
npm init -y  # or equivalent for your stack
make install  # Install dependencies
make verify   # Check setup
```

### 6. First Commit
```bash
git add .
git commit -m "Initial project setup with template system

- Added session-based development workflow
- Configured for [TECH_STACK]
- Ready for Session 0.1: Foundation"
```

## 📋 Detailed Setup (30-45 minutes)

### Phase 1: Foundation (10 min)
- [ ] Create all directories
- [ ] Copy core templates
- [ ] Customize CLAUDE.md
- [ ] Set up .env.example
- [ ] Configure .gitignore

### Phase 2: Workflow (10 min)
- [ ] Customize Implementation_Cadence.md
- [ ] Initialize SESSION_LOG.md
- [ ] Prepare NEXT_SESSION.md
- [ ] Add verify_setup.py
- [ ] Create Makefile

### Phase 3: Tech-Specific (10 min)
- [ ] Add language-specific configs
- [ ] Set up linters
- [ ] Configure test framework
- [ ] Add build tools
- [ ] Set up IDE configs

### Phase 4: Optional Features (10 min)
- [ ] GraphQL setup (if needed)
- [ ] Docker setup (if needed)
- [ ] CI/CD pipelines
- [ ] Documentation tools
- [ ] Deployment configs

### Phase 5: Verification (5 min)
- [ ] Run `make verify`
- [ ] Check all templates customized
- [ ] Ensure no [PLACEHOLDER] remains
- [ ] Test basic commands work
- [ ] Review first session tasks

## 🎯 Tech Stack Specific Additions

### For TypeScript/Node.js
```json
// package.json additions
{
  "scripts": {
    "test": "jest",
    "test:watch": "jest --watch",
    "lint": "eslint src/ --ext .ts,.tsx",
    "build": "tsc",
    "dev": "ts-node-dev src/index.ts"
  }
}
```

### For Python
```txt
# requirements-dev.txt
pytest>=7.0.0
pytest-cov>=3.0.0
black>=22.0.0
pylint>=2.12.0
mypy>=0.950
pre-commit>=2.17.0
```

### For GraphQL Projects
- [ ] Copy GraphQL templates
- [ ] Set up codegen.yml
- [ ] Create schema directory
- [ ] Add Apollo Server (or equivalent)
- [ ] Configure GraphQL linting

### For React/Vue/Angular
- [ ] Component templates
- [ ] Styling setup
- [ ] State management
- [ ] Router configuration
- [ ] Build optimization

## 🔍 Verification Steps

### Must Pass
- [ ] `make verify` runs without errors
- [ ] Git repository initialized
- [ ] Can run test command
- [ ] Can run lint command
- [ ] Project structure created

### Should Have
- [ ] Dependencies installed
- [ ] First test file exists
- [ ] Documentation started
- [ ] CI/CD config present
- [ ] Development environment ready

### Nice to Have
- [ ] Pre-commit hooks
- [ ] IDE settings shared
- [ ] Docker setup
- [ ] Deployment ready
- [ ] Monitoring configured

## 🚨 Common Issues

### Issue: Make command not found
```bash
# Install make or use npm scripts instead
npm run verify  # Instead of make verify
```

### Issue: Python version mismatch
```bash
# Use pyenv or update verify_setup.py
pyenv local 3.9.0
```

### Issue: Permission denied on scripts
```bash
chmod +x scripts/*.py
chmod +x verify_setup.py
```

## 📝 Post-Setup Tasks

1. **Document Decisions**
   - Why this tech stack?
   - Architecture patterns chosen
   - Key constraints

2. **Team Onboarding**
   - Share repository
   - Explain workflow
   - Review templates

3. **First Session Prep**
   - Review Session 0.1 tasks
   - Ensure environment works
   - Prepare any research needed

## 🎉 Setup Complete!

When this checklist is done:
1. Commit everything
2. Take a break
3. Start Session 0.1 fresh
4. Follow the workflow

Your first session command:
```bash
make session SESSION=0.1
# or
npm run session 0.1
```

---

*Remember: The setup investment pays off throughout the entire project!*