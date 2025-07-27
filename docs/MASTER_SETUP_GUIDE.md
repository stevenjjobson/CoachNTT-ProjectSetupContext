# 🎯 Master Setup File for Claude Code

## Instructions for Claude Code

When a user asks you to set up a new project using the ProjectSetupContext system, follow these steps:

### 1. Understand the Request
The user might say something like:
- "Set up a new project using the template system"
- "Initialize a TypeScript GraphQL API with the workflow"
- "Create a new React app with session-based development"

### 2. Access the Context
Load and review these files from ProjectSetupContext:
1. `README.md` - System overview
2. `SETUP_INSTRUCTIONS.md` - Detailed steps
3. `PRD_TEMPLATE.md` - For requirements
4. `checklists/SETUP_CHECKLIST.md` - Quick reference

### 3. Template Organization

```
ProjectSetupContext/templates/
├── core/                    # Always copy these
│   ├── CLAUDE.md.template.md
│   ├── Implementation_Cadence.md.template.md
│   ├── SESSION_LOG.md.template.md
│   ├── NEXT_SESSION.md.template.md
│   └── verify_setup.py.template.md
├── graphql/                 # Copy if using GraphQL
│   ├── GRAPHQL_CONVENTIONS.md.template.md
│   ├── scaffold_graphql.py.template.md
│   ├── codegen.yml.template
│   └── .graphqlrc.json.template
├── efficiency/              # Always copy to scripts/
│   ├── optimize_context.py
│   ├── SMART_HANDOFF.md.template.md
│   ├── PATTERNS.md.template.md
│   └── CONTEXT_EFFICIENCY_QUICK_REF.md
└── project/                 # Project setup files
    ├── .gitignore.template
    ├── .env.example.template
    ├── Makefile.template
    └── CONTRIBUTING.md.template
```

### 4. Customization Rules

When copying templates, replace these placeholders:
- `[PROJECT_NAME]` → Actual project name
- `[YYYY-MM-DD]` → Current date
- `[Your Name]` → User's name or "Development Team"
- `[TECH_STACK]` → Specific technologies
- `[X.Y.Z]` → Version numbers (start with 0.1.0)

### 5. Project Structure Creation

Based on project type, create appropriate structure:

#### For Web Applications:
```bash
src/
├── components/
├── pages/
├── services/
├── utils/
├── styles/
└── types/
```

#### For APIs:
```bash
src/
├── controllers/
├── services/
├── models/
├── middleware/
├── utils/
└── types/
```

#### For Libraries:
```bash
src/
├── core/
├── utils/
├── types/
└── index.ts
```

### 6. Technology-Specific Additions

#### TypeScript Projects:
- Create `tsconfig.json`
- Add `@types/` dependencies
- Configure build scripts
- Set up ESLint with TypeScript

#### Python Projects:
- Create `requirements.txt` and `requirements-dev.txt`
- Add `setup.py` if library
- Configure `pytest.ini`
- Set up `pylintrc`

#### GraphQL Projects:
- Copy all GraphQL templates
- Initialize schema directory
- Set up Apollo Server or equivalent
- Configure code generation

### 7. First Session Preparation

After setup, prepare Session 0.1:

```markdown
## Ready to Start!

Your project is set up with:
✅ Session-based workflow
✅ Context optimization
✅ Testing infrastructure
✅ Documentation templates
✅ GraphQL support (if applicable)

To begin development:
1. Run `make verify` to check setup
2. Review `CLAUDE.md` for project overview  
3. Check `Implementation_Cadence.md` for Session 0.1
4. Start with: `make session SESSION=0.1`

Your first session will focus on:
- Creating core architecture
- Setting up testing
- Establishing patterns
- Configuring CI/CD
```

### 8. Quality Checks

Before declaring setup complete:
- [ ] All placeholders replaced
- [ ] No template files have `.template` extension
- [ ] Directory structure created
- [ ] Git repository initialized
- [ ] Basic commands work (`make verify`)
- [ ] Dependencies specified
- [ ] First session ready to start

### 9. Context Efficiency

Remember to set up for efficient context usage:
- CLAUDE.md should be under 150 lines
- Create PATTERNS.md even if empty
- Set up line-specific loading examples
- Include context optimization scripts

### 10. Handoff to User

Provide clear next steps:

```markdown
✅ Project setup complete!

I've created a session-based development environment optimized for Claude Code.

Key files to review:
- `CLAUDE.md` - Project overview and current state
- `Implementation_Cadence.md` - Your development roadmap
- `PRD.md` - Project requirements
- `verify_setup.py` - Setup verification

Start development with:
```bash
make verify  # Check everything is ready
make session SESSION=0.1  # Begin first session
```

The workflow will guide you through structured 2-3 hour sessions with built-in quality checks.
```

## Important Notes for Claude Code

1. **Don't Load Everything**: Only load templates as needed to stay within context limits
2. **Customize Thoroughly**: Generic templates won't help - make them project-specific
3. **Verify Success**: Always run verification before handing off
4. **Document Decisions**: Record why certain choices were made
5. **Enable Success**: Make the first session as easy as possible

## Common Patterns

### For SaaS Applications:
- Include authentication templates
- Add subscription/billing structure  
- Include admin panel structure
- Add multi-tenancy considerations

### For Open Source Projects:
- Enhanced CONTRIBUTING.md
- Issue and PR templates
- Community guidelines
- Documentation focus

### For Enterprise Projects:
- Compliance documentation
- Audit logging structure
- Enhanced security setup
- Deployment documentation

## Final Checklist for Claude

Before completing setup:
- [ ] User's requirements understood
- [ ] Appropriate templates selected
- [ ] All files customized
- [ ] Structure created
- [ ] Dependencies defined
- [ ] Verification passing
- [ ] Clear next steps provided
- [ ] First session prepared

---

*This master file ensures consistent, high-quality project setups that are optimized for the Claude Code workflow.*