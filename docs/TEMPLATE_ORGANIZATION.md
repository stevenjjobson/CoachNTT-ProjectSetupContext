# 📁 Template Organization Guide

## How to Organize Templates in ProjectSetupContext

When you copy the template files from your main Project_Templates folder into the ProjectSetupContext structure, organize them as follows:

### From Project_Templates/ → To ProjectSetupContext/templates/

```bash
# Core workflow templates (always needed)
Project_Templates/CLAUDE.md.template.md → templates/core/CLAUDE.md.template.md
Project_Templates/Implementation_Cadence.md.template.md → templates/core/Implementation_Cadence.md.template.md
Project_Templates/SESSION_LOG.md.template.md → templates/core/SESSION_LOG.md.template.md
Project_Templates/NEXT_SESSION.md.template.md → templates/core/NEXT_SESSION.md.template.md
Project_Templates/verify_setup.py.template.md → templates/core/verify_setup.py.template.md

# GraphQL templates (optional)
Project_Templates/GRAPHQL_CONVENTIONS.md.template.md → templates/graphql/GRAPHQL_CONVENTIONS.md.template.md
Project_Templates/scaffold_graphql.py.template.md → templates/graphql/scaffold_graphql.py.template.md
Project_Templates/codegen.yml.template → templates/graphql/codegen.yml.template
Project_Templates/.graphqlrc.eslint.json.template → templates/graphql/.graphqlrc.json.template

# Efficiency tools
Project_Templates/optimize_context.py → templates/efficiency/optimize_context.py
Project_Templates/SMART_HANDOFF.md.template → templates/efficiency/SMART_HANDOFF.md.template.md
Project_Templates/CONTEXT_EFFICIENCY_QUICK_REF.md → templates/efficiency/PATTERNS.md.template.md

# Project setup files
Project_Templates/Makefile.template → templates/project/Makefile.template
(Already created .gitignore.template in templates/project/)
```

### Complete Structure After Organization:

```
ProjectSetupContext/
├── README.md ✓
├── SETUP_INSTRUCTIONS.md ✓
├── MASTER_SETUP_GUIDE.md ✓
├── PRD_TEMPLATE.md ✓
├── COMPLETE_GUIDE.md ✓
├── templates/
│   ├── core/
│   │   ├── CLAUDE.md.template.md
│   │   ├── Implementation_Cadence.md.template.md
│   │   ├── SESSION_LOG.md.template.md
│   │   ├── NEXT_SESSION.md.template.md
│   │   └── verify_setup.py.template.md
│   ├── graphql/
│   │   ├── GRAPHQL_CONVENTIONS.md.template.md
│   │   ├── scaffold_graphql.py.template.md
│   │   ├── codegen.yml.template
│   │   └── .graphqlrc.json.template
│   ├── efficiency/
│   │   ├── optimize_context.py
│   │   ├── SMART_HANDOFF.md.template.md
│   │   ├── PATTERNS.md.template.md
│   │   └── CONTEXT_EFFICIENCY_QUICK_REF.md
│   └── project/
│       ├── .gitignore.template ✓
│       ├── .env.example.template
│       ├── Makefile.template ✓
│       └── CONTRIBUTING.md.template
├── examples/
│   └── task-api-setup.md ✓
└── checklists/
    ├── SETUP_CHECKLIST.md ✓
    └── SESSION_CHECKLIST.md ✓
```

## 📝 Additional Templates to Create

You still need to create these simple templates:

### templates/project/.env.example.template
```bash
# Session Tracking
LAST_COMPLETED_SESSION=0.0
CURRENT_PHASE=0

# Development
NODE_ENV=development
LOG_LEVEL=debug

# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/dbname

# API Keys (replace with your own)
API_KEY=your-api-key-here
SECRET_KEY=your-secret-key-here

# GraphQL (if applicable)
GRAPHQL_PLAYGROUND=true
GRAPHQL_INTROSPECTION=true

# Add your project-specific variables below
```

### templates/project/CONTRIBUTING.md.template
```markdown
# Contributing to [PROJECT_NAME]

Thank you for your interest in contributing!

## Development Workflow

This project uses a session-based development approach. See `CLAUDE.md` for details.

## Getting Started

1. Fork the repository
2. Clone your fork
3. Run `make setup` to initialize
4. Run `make verify` to check setup
5. Create a feature branch
6. Make your changes following the session workflow
7. Submit a pull request

## Code Style

- Follow the patterns in `PATTERNS.md`
- Run `make lint` before committing
- Write tests for new features
- Update documentation

## Session-Based Contributions

When contributing:
1. Pick a session-sized task (2-3 hours)
2. Follow the Implementation_Cadence structure
3. Document your decisions
4. Create clean commits

## Questions?

Check existing issues or create a new one!
```

## 🚀 Quick Copy Commands

To quickly set up the folder structure:

```bash
# Create the complete structure
mkdir -p ProjectSetupContext/{templates/{core,graphql,efficiency,project},examples,checklists}

# Copy your existing templates (adjust paths as needed)
cp Project_Templates/*.template.md ProjectSetupContext/templates/core/
cp Project_Templates/GRAPHQL*.md ProjectSetupContext/templates/graphql/
cp Project_Templates/*context*.py ProjectSetupContext/templates/efficiency/

# The files created in this session are already in place
```

## ✅ Final Checklist

- [x] Main documentation files created
- [x] Setup instructions documented
- [x] PRD template created
- [x] Example project shown
- [x] Checklists provided
- [x] File organization clear
- [ ] Copy existing templates to proper folders
- [ ] Create missing simple templates
- [ ] Test with a real project setup

---

*Your ProjectSetupContext folder is now ready to revolutionize how you start new projects with Claude Code!*