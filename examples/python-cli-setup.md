# 📖 Example: Python CLI Tool Setup

This example shows ProjectSetupContext setting up a Python command-line tool.

## Project Request

"I need to build a Python CLI tool for data pipeline management. It should support multiple data sources (databases, APIs, files), have a plugin architecture, include scheduling capabilities, and provide both CLI and programmatic interfaces."

## What Gets Created

### 1. PRD.md (CLI-Focused)
```markdown
# 📄 Product Requirements Document (PRD)

**Project Name**: DataFlow CLI  
**Version**: 1.0  
**Date**: 2024-01-20  
**Status**: Approved  

## 📋 Executive Summary

### Problem Statement
Data engineers need a flexible, scriptable tool to manage data pipelines across various sources without writing boilerplate code for each integration.

### Solution Overview
DataFlow CLI provides a unified interface for data pipeline management with built-in connectors, transformation capabilities, and scheduling, all accessible via CLI or Python API.

### Key Benefits
- Single tool for multiple data sources
- Extensible plugin architecture
- Built-in scheduling and monitoring
- Both CLI and library usage
```

### 2. Project Structure
```
dataflow-cli/
├── src/
│   └── dataflow/
│       ├── __init__.py
│       ├── __main__.py          # CLI entry point
│       ├── cli/
│       │   ├── __init__.py
│       │   ├── commands/
│       │   │   ├── run.py
│       │   │   ├── schedule.py
│       │   │   └── config.py
│       │   └── utils.py
│       ├── core/
│       │   ├── __init__.py
│       │   ├── pipeline.py
│       │   ├── connector.py
│       │   └── scheduler.py
│       ├── connectors/
│       │   ├── __init__.py
│       │   ├── base.py
│       │   ├── postgres.py
│       │   ├── mysql.py
│       │   ├── rest_api.py
│       │   └── file_system.py
│       ├── plugins/
│       │   ├── __init__.py
│       │   └── loader.py
│       └── utils/
│           ├── __init__.py
│           ├── config.py
│           └── logging.py
├── tests/
│   ├── unit/
│   ├── integration/
│   └── fixtures/
├── docs/
│   ├── cli-reference.md
│   ├── plugin-development.md
│   └── examples/
├── examples/
│   ├── basic_pipeline.py
│   └── scheduled_etl.py
└── scripts/
    └── install.sh
```

### 3. Implementation_Cadence.md Sessions
```markdown
### Session 1.1: CLI Foundation & Architecture
**Context Window**: ~2500 tokens
**Prerequisites**: Phase 0 complete
**Duration**: 2-3 hours

- [ ] Set up Click for CLI framework
- [ ] Create main command group structure
- [ ] Implement configuration management
- [ ] Add logging with rich formatting
- [ ] Create plugin loader architecture
- [ ] Set up entry points
- [ ] Add version command
- [ ] Implement help system
- [ ] Write CLI tests
- [ ] Create basic error handling
- [ ] **Checkpoint**: CLI runs with basic commands

### Session 1.2: Core Pipeline Engine
**Context Window**: ~2500 tokens
**Prerequisites**: Session 1.1 complete
**Duration**: 2-3 hours

- [ ] Design pipeline abstract base class
- [ ] Implement pipeline runner
- [ ] Create connector interface
- [ ] Add data transformation layer
- [ ] Implement pipeline configuration
- [ ] Add validation system
- [ ] Create execution context
- [ ] Add progress reporting
- [ ] Write pipeline tests
- [ ] **Checkpoint**: Can define and run simple pipeline
```

### 4. Python-Specific Files

**setup.py**
```python
from setuptools import setup, find_packages

setup(
    name="dataflow-cli",
    version="0.1.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    include_package_data=True,
    install_requires=[
        "click>=8.1.0",
        "rich>=13.0.0",
        "pydantic>=2.0.0",
        "sqlalchemy>=2.0.0",
        "requests>=2.28.0",
        "schedule>=1.2.0",
        "python-dotenv>=1.0.0",
    ],
    extras_require={
        "dev": [
            "pytest>=7.0.0",
            "pytest-cov>=4.0.0",
            "pytest-mock>=3.10.0",
            "black>=23.0.0",
            "pylint>=2.15.0",
            "mypy>=1.0.0",
            "pre-commit>=3.0.0",
        ],
        "postgres": ["psycopg2-binary>=2.9.0"],
        "mysql": ["pymysql>=1.0.0"],
    },
    entry_points={
        "console_scripts": [
            "dataflow=dataflow.__main__:cli",
        ],
        "dataflow.connectors": [
            "postgres=dataflow.connectors.postgres:PostgresConnector",
            "mysql=dataflow.connectors.mysql:MySQLConnector",
        ],
    },
    python_requires=">=3.9",
)
```

**pyproject.toml**
```toml
[build-system]
requires = ["setuptools>=65.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "dataflow-cli"
dynamic = ["version"]
description = "A flexible CLI tool for data pipeline management"
readme = "README.md"
requires-python = ">=3.9"
license = {text = "MIT"}

[tool.black]
line-length = 88
target-version = ['py39']

[tool.pylint]
max-line-length = 88
disable = ["C0111", "R0903"]

[tool.mypy]
python_version = "3.9"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py"]
addopts = "-v --cov=dataflow --cov-report=html"
```

### 5. Makefile (Python CLI Specific)
```makefile
.PHONY: install install-dev test lint format build

install:
	pip install -e .

install-dev:
	pip install -e ".[dev]"
	pre-commit install

test:
	pytest

test-watch:
	ptw -- pytest

lint:
	pylint src/dataflow
	mypy src/dataflow

format:
	black src/ tests/
	isort src/ tests/

build:
	python -m build

clean:
	rm -rf build/ dist/ *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

# CLI-specific commands
run-example:
	dataflow run examples/basic_pipeline.py

install-completions:
	dataflow --install-completion

dev-cli:
	python -m dataflow
```

## Benefits Demonstrated

1. **CLI Best Practices**: Click, rich output, completions
2. **Plugin Architecture**: Extensible from day one
3. **Distribution Ready**: setup.py configured properly
4. **Testing Strategy**: Unit + integration + fixtures
5. **Developer Friendly**: Watch mode, examples included

## Unique Aspects for CLI Tools

- **Entry Points**: Properly configured for pip install
- **Plugin System**: Built-in extensibility
- **Documentation**: CLI reference from start
- **Examples**: Runnable examples included
- **Installation**: Proper packaging setup

---

*This example shows how ProjectSetupContext handles different project types while maintaining the same quality standards.*