#!/bin/bash
# Quick setup verification script
# Run this after Claude Code completes setup to catch common issues

echo "🔍 Quick Setup Verification"
echo "========================="

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

errors=0
warnings=0

# Check for placeholders
echo -n "Checking for unreplaced placeholders... "
if grep -r "\[PROJECT_NAME\]\|\[TECH_STACK\]\|\[Your Name\]" --include="*.md" --include="*.py" --include="*.json" . 2>/dev/null | grep -v "templates/"; then
    echo -e "${RED}FOUND${NC}"
    ((errors++))
else
    echo -e "${GREEN}OK${NC}"
fi

# Check core files exist
echo -n "Checking core files... "
core_files=("CLAUDE.md" "Implementation_Cadence.md" "SESSION_LOG.md" "verify_setup.py" "Makefile")
missing_core=0
for file in "${core_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo -e "\n  ${RED}Missing: $file${NC}"
        ((missing_core++))
    fi
done
if [ $missing_core -eq 0 ]; then
    echo -e "${GREEN}OK${NC}"
else
    ((errors++))
fi

# Check directory structure
echo -n "Checking directory structure... "
required_dirs=("src" "tests" "docs" "scripts")
missing_dirs=0
for dir in "${required_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        echo -e "\n  ${RED}Missing: $dir/${NC}"
        ((missing_dirs++))
    fi
done
if [ $missing_dirs -eq 0 ]; then
    echo -e "${GREEN}OK${NC}"
else
    ((errors++))
fi

# Check for .env file
echo -n "Checking environment setup... "
if [ -f ".env" ]; then
    echo -e "${GREEN}OK${NC}"
elif [ -f ".env.example" ]; then
    echo -e "${YELLOW}WARNING${NC} - .env.example exists but no .env"
    ((warnings++))
else
    echo -e "${RED}MISSING${NC}"
    ((errors++))
fi

# Check git initialization
echo -n "Checking git repository... "
if [ -d ".git" ]; then
    echo -e "${GREEN}OK${NC}"
else
    echo -e "${YELLOW}WARNING${NC} - Not initialized"
    ((warnings++))
fi

# Check executable permissions
echo -n "Checking script permissions... "
if [ -f "verify_setup.py" ] && [ -x "verify_setup.py" ]; then
    echo -e "${GREEN}OK${NC}"
else
    echo -e "${YELLOW}WARNING${NC} - verify_setup.py not executable"
    ((warnings++))
fi

# Tech-specific checks
echo -n "Detecting project type... "
if [ -f "package.json" ]; then
    echo -e "${GREEN}Node.js/TypeScript${NC}"
    if [ ! -f "tsconfig.json" ] && grep -q "typescript" package.json; then
        echo -e "  ${YELLOW}WARNING${NC} - TypeScript detected but no tsconfig.json"
        ((warnings++))
    fi
elif [ -f "requirements.txt" ]; then
    echo -e "${GREEN}Python${NC}"
elif [ -f "go.mod" ]; then
    echo -e "${GREEN}Go${NC}"
else
    echo -e "${YELLOW}Unknown${NC}"
fi

# Summary
echo ""
echo "========================="
echo "Summary:"
echo "  Errors: $errors"
echo "  Warnings: $warnings"

if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo -e "${GREEN}✅ Setup looks perfect!${NC}"
    exit 0
elif [ $errors -eq 0 ]; then
    echo -e "${YELLOW}⚠️  Setup complete with warnings${NC}"
    exit 0
else
    echo -e "${RED}❌ Setup has errors that need fixing${NC}"
    exit 1
fi