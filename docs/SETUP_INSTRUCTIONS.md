# 📋 Setup Instructions for Claude Code

## 🎯 Project Initialization Steps

When a user references this ProjectSetupContext folder, follow these steps to set up their project:

### Step 1: Gather Project Information

Ask for or confirm:
- Project name
- Primary programming language
- Framework/libraries (if any)
- Key features (3-5 main capabilities)
- Target deployment (web/mobile/desktop/API)
- Team size (solo/small/large)

### Step 2: Create Project Structure

```bash
# Create base directories
mkdir -p src/{core,services,utils,interfaces}
mkdir -p tests/{unit,integration,e2e}
mkdir -p docs/{api,architecture,guides}
mkdir -p scripts
mkdir -p .github/workflows

# If GraphQL project
mkdir -p src/graphql/{schema,resolvers,dataloaders,generated}
mkdir -p tests/graphql/{resolvers,integration}
```

### Step 3: Copy and Customize Templates

#### A. Core Templates (Always copy these)

1. **CLAUDE.md** - Customize:
   - Replace [PROJECT_NAME] with actual name
   - Fill in Tech Stack
   - Set initial status to "Phase 0 - Foundation (0%)"
   - Add project-specific quick start commands

2. **Implementation_Cadence.md** - Customize:
   - Replace [PROJECT_NAME]
   - Adjust session count based on project scope
   - Customize feature names in Phase 1
   - Add technology-specific sessions

3. **SESSION_LOG.md** - Initialize:
   - Add project name
   - Set first session as "0.1: Project Foundation"
   - Add current date

4. **NEXT_SESSION.md** - Prepare:
   - Set up for Session 0.1
   - List specific setup tasks
   - Add technology-specific checklist items

5. **verify_setup.py** - Customize:
   - Set correct Python version requirement
   - Add project-specific file checks
   - Include framework-specific verifications
   - Add dependency checks

#### B. Project Files

6. **.gitignore** - Generate appropriate version:
   - Use gitignore.io API for tech stack
   - Add project-specific exclusions
   - Include .env and secrets

7. **.env.example** - Create with:
   ```
   # Session Tracking
   LAST_COMPLETED_SESSION=0.0
   CURRENT_PHASE=0
   
   # Project-specific vars
   DATABASE_URL=
   API_KEY=
   NODE_ENV=development
   ```

8. **Makefile** - Include:
   - Basic commands (install, test, lint, build)
   - Session management commands
   - Context optimization commands
   - Project-specific tasks

#### C. Optional Components

9. **For GraphQL Projects**:
   - Copy all files from templates/graphql/
   - Set up codegen.yml with project models
   - Initialize base schema

10. **For Web Projects**:
    - Add component templates
    - Include styling setup
    - Add bundler config

### Step 4: Create Initial Files

```python
# Create README.md
readme_content = f"""# {project_name}

## Overview
{project_description}

## Quick Start
1. Run `make install` to set up dependencies
2. Run `make verify` to check setup
3. Run `make dev` to start development

## Development Workflow
This project uses a session-based development approach. See CLAUDE.md for details.

## Tech Stack
{tech_stack_list}
"""

# Create PRD.md from template
# Copy PRD_TEMPLATE.md and fill in project details
```

### Step 5: Initialize Version Control

```bash
git init
git add .
git commit -m "Initial project setup with template system"
```

### Step 6: Set Up Development Environment

Based on the tech stack:

#### For Node.js/TypeScript:
```json
// package.json
{
  "name": "{project_name}",
  "scripts": {
    "test": "jest",
    "lint": "eslint src/",
    "build": "tsc",
    "dev": "ts-node-dev src/index.ts",
    "codegen": "graphql-codegen"
  }
}
```

#### For Python:
```txt
# requirements.txt
pytest>=7.0.0
black>=22.0.0
pylint>=2.12.0
mypy>=0.950
```

### Step 7: Prepare Session 0.1 Checklist

Create a focused checklist for the first session:

```markdown
## Session 0.1: Project Foundation (Ready to Start)

### Pre-session:
- [ ] All templates copied and customized
- [ ] Git repository initialized
- [ ] Development environment ready

### Session Tasks:
- [ ] Create initial project structure
- [ ] Set up linting and formatting
- [ ] Write first test (even placeholder)
- [ ] Configure build system
- [ ] Document core architecture decisions
- [ ] Set up CI/CD pipeline basics

### Success Criteria:
- Can run `make test` successfully
- Can run `make lint` successfully
- Basic project structure is in place
```

### Step 8: Generate Context Summary

Create `.context-initial.md`:

```markdown
# Initial Context for {project_name}

## Project Setup Complete ✅
- Templates customized for {tech_stack}
- Development environment configured
- Ready for Session 0.1

## Key Decisions Made:
- Architecture: {pattern}
- Testing: {framework}
- State Management: {approach}

## Next Steps:
1. Run `make verify` to confirm setup
2. Review Implementation_Cadence.md Session 0.1
3. Start first development session
```

### Step 9: Final Verification

Run these checks:
1. All template placeholders replaced
2. No [BRACKET] placeholders remain
3. Directory structure created
4. Git initialized
5. Dependencies specified
6. First session ready

### Step 10: Handoff Message

Provide this summary to the user:

```markdown
✅ Project setup complete for {project_name}!

Created:
- Complete project structure
- Customized workflow templates
- Development environment config
- Session-based workflow

To start development:
1. Run `make verify` to check everything
2. Review SESSION_LOG.md and CLAUDE.md
3. Begin with Session 0.1 in Implementation_Cadence.md

Your first session prompt:
"I'm starting {project_name} Session 0.1. Please review:
1. @CLAUDE.md
2. @Implementation_Cadence.md (Session 0.1)
3. @verify_setup.py

Ready to implement the project foundation."
```

## 🔄 Customization Decision Tree

```
Is it a GraphQL project?
├─ Yes: Include GraphQL templates
└─ No: Skip GraphQL setup

Is it a web application?
├─ Yes: Add component templates
└─ No: Focus on API/CLI templates

Team size?
├─ Solo: Simplified workflow
├─ Small: Standard workflow
└─ Large: Add collaboration tools

Deployment target?
├─ Cloud: Add containerization
├─ On-premise: Add deployment scripts
└─ Package: Add publishing config
```

## 📝 Important Notes for Claude Code

1. **Always maintain context efficiency** - Don't load all templates at once
2. **Customize, don't just copy** - Replace all placeholders
3. **Verify each step** - Ensure setup is correct before proceeding
4. **Document decisions** - Record why certain choices were made
5. **Prepare for success** - Make Session 0.1 as easy as possible to start

---

*Follow these instructions to set up a project that's optimized for the template-based workflow.*


## 🔍 Multi-Stage Verification Process

To ensure reliable setup, follow this staged approach with verification at each step:

### Stage 1: Core Setup (5 minutes)
**Goal**: Get basic structure working

1. Create directory structure
2. Copy core templates only (CLAUDE.md, Implementation_Cadence.md, etc.)
3. Replace basic placeholders ([PROJECT_NAME] only)

**Verify Stage 1**:
```bash
# Check structure created
ls -la src/ tests/ docs/

# Check core files exist
ls *.md verify_setup.py

# Check no basic placeholders
grep -n "\[PROJECT_NAME\]" *.md || echo "✓ No PROJECT_NAME placeholders"

# Show what we have so far
echo "Stage 1 complete. Files created:"
find . -type f -name "*.md" | head -10
```

### Stage 2: Tech-Specific Setup (5 minutes)
**Goal**: Customize for the technology stack

1. Update Makefile commands for correct tech
2. Create package.json OR requirements.txt
3. Add tech-specific configurations
4. Update all remaining placeholders

**Verify Stage 2**:
```bash
# Run quick verification
chmod +x quick-verify.sh
./quick-verify.sh

# Check Makefile has correct commands
grep -E "npm|python|go" Makefile

# Verify no placeholders remain
grep -r "\[.*\]" --include="*.md" --include="*.json" . | grep -v "templates/" || echo "✓ No placeholders"

# Test a basic command
make help
```

### Stage 3: Optional Features (5 minutes)
**Goal**: Add GraphQL, Docker, etc. if needed

1. Copy GraphQL templates if needed
2. Set up additional tooling
3. Configure integrations

**Verify Stage 3**:
```bash
# Run full verification
python verify_setup.py

# If GraphQL added, check:
ls src/graphql/schema/ 2>/dev/null && echo "✓ GraphQL structure created"

# Test everything works
make verify
```

## 🚨 Critical Verification Points

### After EACH file creation, verify:

1. **No Placeholders** 
   ```bash
   grep "\[" <filename> || echo "✓ Clean"
   ```

2. **Correct Tech Stack**
   ```bash
   # For Node.js projects
   grep "npm" Makefile && echo "✓ Node.js commands"
   
   # For Python projects  
   grep "python\|pytest" Makefile && echo "✓ Python commands"
   ```

3. **File Exists and Non-Empty**
   ```bash
   [[ -s <filename> ]] && echo "✓ File exists" || echo "✗ Missing/empty"
   ```

## 🔄 Self-Verification Checklist for Claude

Before proceeding to next stage, confirm:

### Stage 1 Checklist:
- [ ] Created src/, tests/, docs/, scripts/ directories
- [ ] Copied CLAUDE.md, Implementation_Cadence.md, SESSION_LOG.md
- [ ] Copied verify_setup.py and Makefile
- [ ] Replaced [PROJECT_NAME] in all files
- [ ] No syntax errors in any file

### Stage 2 Checklist:
- [ ] Makefile uses correct commands for tech stack
- [ ] Created appropriate dependency file (package.json/requirements.txt)
- [ ] All placeholders replaced with actual values
- [ ] Basic commands work (make help)
- [ ] No [BRACKETS] remain except in templates/

### Stage 3 Checklist:
- [ ] Optional features correctly integrated
- [ ] All tests pass (even if no tests exist yet)
- [ ] verify_setup.py shows all green
- [ ] Can start Session 0.1
- [ ] Git repository initialized