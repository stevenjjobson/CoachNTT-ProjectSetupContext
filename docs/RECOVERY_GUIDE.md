# 🚨 Setup Recovery Guide

## When Things Go Wrong

If Claude Code's setup isn't quite right, here's how to fix common issues:

## 🔴 Critical Issues (Must Fix)

### 1. Placeholders Still Present
```bash
# Find all remaining placeholders
grep -r "\[" --include="*.md" --include="*.py" .

# Common files to check:
- CLAUDE.md
- Implementation_Cadence.md
- Makefile
- package.json or requirements.txt
```

**Fix**: Manually replace with your values:
- [PROJECT_NAME] → YourActualProjectName
- [TECH_STACK] → Your actual tech stack
- [Your Name] → Your name or "Development Team"

### 2. Wrong Tech Stack Commands
If Makefile has npm commands but you're using Python:

**Fix**: Update Makefile commands:
```makefile
# Change from:
test:
    npm test

# To:
test:
    python -m pytest
```

### 3. Missing Core Directories
```bash
# Quick fix - create all at once:
mkdir -p src/{core,services,utils} tests/{unit,integration} docs scripts
```

## 🟡 Common Issues (Should Fix)

### 4. No Git Repository
```bash
git init
git add .
git commit -m "Initial project setup with template system"
```

### 5. Wrong File Permissions
```bash
# Make scripts executable
chmod +x verify_setup.py
chmod +x scripts/*.py
chmod +x quick-verify.sh
```

### 6. Missing Dependencies File
For Node.js:
```bash
npm init -y
npm install --save-dev typescript @types/node jest @types/jest
```

For Python:
```bash
cat > requirements.txt << 'EOF'
# Add your dependencies
pytest>=7.0.0
black>=22.0.0
pylint>=2.12.0
EOF
```

## 🟢 Minor Issues (Nice to Fix)

### 7. Generic Session Tasks
Update Implementation_Cadence.md Session 1.1 with specific tasks for your project.

### 8. Missing .env File
```bash
cp .env.example .env
# Then edit .env with your values
```

### 9. Incomplete GraphQL Setup
If you need GraphQL but it wasn't set up:
```bash
# Copy GraphQL templates manually
cp ProjectSetupContext/templates/graphql/* .
npm install apollo-server-express graphql
```

## 🛠️ Full Recovery Process

If setup is really broken, start over with this process:

### Step 1: Clean Slate
```bash
# Save any work you want to keep
git stash

# Or start completely fresh
cd ..
mv project-name project-name-backup
mkdir project-name
cd project-name
```

### Step 2: Manual Core Setup
```bash
# 1. Create structure
mkdir -p src tests docs scripts

# 2. Copy core templates manually
cp /path/to/templates/core/*.md .
cp /path/to/templates/core/verify_setup.py .

# 3. Create Makefile
cp /path/to/templates/project/Makefile.template Makefile

# 4. Initialize git
git init
```

### Step 3: Customize Essentials
1. Edit CLAUDE.md - Add project name and description
2. Edit Makefile - Fix commands for your tech stack
3. Run `./quick-verify.sh` to check

### Step 4: Verify and Continue
```bash
make verify  # Should work now
make session SESSION=0.1  # Start development
```

## 📋 Prevention Checklist

To avoid issues in future setups:

### Before Starting
- [ ] Clear project requirements
- [ ] Specific tech stack decided
- [ ] Project type identified (API/App/Library)

### During Setup Request
- [ ] Mention all key technologies
- [ ] Specify if GraphQL needed
- [ ] Note any special requirements

### After Setup
- [ ] Run quick-verify.sh immediately
- [ ] Check one file thoroughly (CLAUDE.md)
- [ ] Try one command (make verify)
- [ ] Fix any issues before proceeding

## 💡 Pro Tips

1. **Incremental Approach**
   ```markdown
   "First, just set up the core workflow files and verify they work"
   "Now add the TypeScript-specific configuration"
   "Finally, add the GraphQL setup"
   ```

2. **Explicit Verification**
   ```markdown
   "After creating the files, show me the output of:
   - ls -la
   - head -20 CLAUDE.md
   - grep '\[' *.md"
   ```

3. **Tech-Specific Requests**
   ```markdown
   "Make sure the Makefile uses pytest for Python, not npm test"
   "Use TypeScript configuration for a Node.js Express API"
   ```

## 🚀 Quick Wins

Even if setup isn't perfect:

1. **Core workflow files** are valuable even with minor issues
2. **Directory structure** saves time even if incomplete  
3. **Templates provide patterns** even if not customized
4. **Verification scripts** catch issues early

Remember: **80% automated setup + 20% manual fixes** is still faster than 100% manual setup!

## 🆘 Still Stuck?

If you can't recover:

1. Use just the templates you need
2. Set up manually following SETUP_CHECKLIST.md
3. Cherry-pick useful parts
4. Build incrementally

The system is modular - use what works, fix what doesn't!

---

*Most setup issues are minor and fixable in under 5 minutes. Don't let small problems stop you from using this powerful system!*