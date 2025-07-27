#!/bin/bash

# ProjectSetupContext - Automated Setup Script
# This script helps set up a new project using the ProjectSetupContext templates

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
usage() {
    echo "Usage: $0 [PROJECT_NAME] [PROJECT_TYPE] [LANGUAGE]"
    echo ""
    echo "Arguments:"
    echo "  PROJECT_NAME    Name of your project"
    echo "  PROJECT_TYPE    Type of project (web-api, react-app, cli-tool, library)"
    echo "  LANGUAGE        Primary language (typescript, python, go, javascript)"
    echo ""
    echo "Example:"
    echo "  $0 my-awesome-api web-api typescript"
    exit 1
}

# Check arguments
if [ $# -lt 3 ]; then
    usage
fi

PROJECT_NAME=$1
PROJECT_TYPE=$2
LANGUAGE=$3
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

print_status "Setting up project: $PROJECT_NAME"
print_status "Project type: $PROJECT_TYPE"
print_status "Language: $LANGUAGE"

# Stage 1: Core Setup
print_status "Stage 1: Creating directory structure..."

# Create project directory
if [ -d "$PROJECT_NAME" ]; then
    print_error "Directory $PROJECT_NAME already exists!"
    exit 1
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Create basic structure
mkdir -p src tests docs scripts logs

# Copy core templates
print_status "Copying core workflow templates..."
cp "$TEMPLATE_DIR/core/CLAUDE.md.template" CLAUDE.md
cp "$TEMPLATE_DIR/core/Implementation_Cadence.md.template" Implementation_Cadence.md
cp "$TEMPLATE_DIR/core/SESSION_LOG.md.template" SESSION_LOG.md
cp "$TEMPLATE_DIR/core/NEXT_SESSION.md.template" NEXT_SESSION.md
cp "$TEMPLATE_DIR/core/verify_setup.py.template" verify_setup.py

# Copy session management templates
cp -r "$TEMPLATE_DIR/session-management" .

# Copy project files
cp "$TEMPLATE_DIR/project/.gitignore.template" .gitignore
cp "$TEMPLATE_DIR/project/Makefile.template" Makefile
cp "$TEMPLATE_DIR/project/quick-verify.sh" quick-verify.sh
chmod +x quick-verify.sh

# Stage 2: Tech-Specific Setup
print_status "Stage 2: Customizing for $LANGUAGE and $PROJECT_TYPE..."

# Replace placeholders
print_status "Replacing placeholders..."
find . -type f -name "*.md" -o -name "Makefile" -o -name "*.py" -o -name "*.sh" | while read file; do
    # Use sed with different delimiter to avoid issues with slashes in paths
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' "s|\[PROJECT_NAME\]|$PROJECT_NAME|g" "$file"
        sed -i '' "s|\[PROJECT_TYPE\]|$PROJECT_TYPE|g" "$file"
        sed -i '' "s|\[LANGUAGE\]|$LANGUAGE|g" "$file"
        sed -i '' "s|\[DATE\]|$(date +%Y-%m-%d)|g" "$file"
    else
        # Linux
        sed -i "s|\[PROJECT_NAME\]|$PROJECT_NAME|g" "$file"
        sed -i "s|\[PROJECT_TYPE\]|$PROJECT_TYPE|g" "$file"
        sed -i "s|\[LANGUAGE\]|$LANGUAGE|g" "$file"
        sed -i "s|\[DATE\]|$(date +%Y-%m-%d)|g" "$file"
    fi
done

# Create language-specific files
case "$LANGUAGE" in
    "python")
        print_status "Setting up Python project..."
        cat > requirements.txt << EOF
# Core dependencies
pytest>=7.0.0
pytest-cov>=4.0.0
black>=23.0.0
flake8>=6.0.0
mypy>=1.0.0

# Add your project dependencies here
EOF
        
        cat > setup.py << EOF
from setuptools import setup, find_packages

setup(
    name="$PROJECT_NAME",
    version="0.1.0",
    packages=find_packages(),
    python_requires=">=3.8",
)
EOF
        ;;
    
    "typescript"|"javascript")
        print_status "Setting up Node.js project..."
        cat > package.json << EOF
{
  "name": "$PROJECT_NAME",
  "version": "0.1.0",
  "description": "$PROJECT_TYPE project",
  "main": "src/index.js",
  "scripts": {
    "test": "jest",
    "lint": "eslint src/",
    "build": "tsc",
    "dev": "nodemon src/index.js"
  },
  "keywords": [],
  "author": "",
  "license": "MIT",
  "devDependencies": {
    "@types/node": "^20.0.0",
    "eslint": "^8.0.0",
    "jest": "^29.0.0",
    "nodemon": "^3.0.0",
    "typescript": "^5.0.0"
  }
}
EOF
        
        if [ "$LANGUAGE" = "typescript" ]; then
            cat > tsconfig.json << EOF
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "lib": ["ES2020"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist", "tests"]
}
EOF
        fi
        ;;
    
    "go")
        print_status "Setting up Go project..."
        cat > go.mod << EOF
module github.com/yourusername/$PROJECT_NAME

go 1.21
EOF
        ;;
esac

# Create README
cat > README.md << EOF
# $PROJECT_NAME

A $PROJECT_TYPE project built with $LANGUAGE.

## Getting Started

This project uses the ProjectSetupContext workflow system. See:
- \`CLAUDE.md\` - AI context and current state
- \`Implementation_Cadence.md\` - Development roadmap
- \`SESSION_LOG.md\` - Session history
- \`NEXT_SESSION.md\` - Quick start for next session

## Setup

1. Review project structure
2. Run verification: \`./quick-verify.sh\`
3. Install dependencies
4. Start development

## Development Workflow

Follow the session-based development approach outlined in the documentation.

---

*Generated using [ProjectSetupContext](https://github.com/stevenjjobson/CoachNTT-ProjectSetupContext)*
EOF

# Stage 3: Verification
print_status "Stage 3: Running verification..."

# Make verify_setup.py executable
chmod +x verify_setup.py

# Run quick verification
if ./quick-verify.sh; then
    print_success "Stage 1 verification passed!"
else
    print_warning "Some verification checks failed. Please review and fix."
fi

# Final summary
echo ""
print_success "Project setup complete!"
echo ""
echo "📁 Project created at: $(pwd)"
echo ""
echo "📋 Next steps:"
echo "1. cd $PROJECT_NAME"
echo "2. Review CLAUDE.md and customize for your project"
echo "3. Run ./verify_setup.py for detailed checks"
echo "4. Start your first development session!"
echo ""
echo "💡 To start development:"
echo "   Copy the prompt from NEXT_SESSION.md and paste to Claude Code"
echo ""

# Check for remaining placeholders
remaining=$(grep -r "\[" . --include="*.md" --include="Makefile" 2>/dev/null | grep -v "^\./\.git" | wc -l)
if [ $remaining -gt 0 ]; then
    print_warning "Found $remaining potential placeholders remaining. Run:"
    echo "   grep -r \"\\[\" . --include=\"*.md\" --include=\"Makefile\""
fi