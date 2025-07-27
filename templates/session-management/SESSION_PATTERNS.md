# 📊 Session Patterns: Context-Aware Development

## Overview

This document provides patterns and examples for managing context windows effectively during AI-assisted development sessions. Following these patterns prevents context exhaustion and ensures smooth session completion.

## 🎯 Core Pattern: Context-Aware Session Flow

### 1. Session Initialization

```markdown
## Session X.X Context Plan
**Estimated Output**: ~XXXX lines
**Context Budget**: ~XX% of window
**Commit Points**: 
- [ ] Component 1 complete
- [ ] Component 2 complete  
- [ ] Final documentation

Starting implementation...
```

### 2. Progress Tracking

Throughout the session, include natural progress updates:

```markdown
✅ Created database schema (7 files, ~2000 lines)
📊 Context estimate: ~30% used
🎯 Next: API implementation...
```

### 3. Checkpoint Decisions

At major milestones:

```markdown
✅ Core functionality complete
💡 Good checkpoint opportunity - shall I commit before continuing?
```

## 📐 Token-to-Code Estimation Ratios

Based on empirical observation across multiple projects:

| Content Type | Lines per 1000 tokens | Notes |
|-------------|----------------------|-------|
| SQL/DDL | 500-800 | Schema definitions, migrations |
| Backend Code | 300-500 | With docstrings and validation |
| Frontend Code | 400-600 | HTML/CSS/JS combined |
| Tests | 400-600 | Comprehensive test cases |
| Documentation | 200-300 | Detailed explanations |
| Config Files | 800-1000 | JSON, YAML, simple configs |

## 🔄 Example Session with Context Management

### Example: Feature Implementation Session

```markdown
User: "Ready to implement the user authentication feature"

AI: "Starting User Authentication Implementation

## Context Plan
**Estimated Output**: ~2500 lines (models, API, tests)
**Context Budget**: ~60% of window
**Commit Points**:
- [ ] Database models complete
- [ ] API endpoints implemented
- [ ] Tests written
- [ ] Documentation updated

Creating database models first..."

[After models]

"✅ User and Session models created (2 files, ~400 lines)
📊 Progress: ~15% of budget used
🎯 Next: Authentication endpoints..."

[After API implementation]

"✅ Auth endpoints complete (5 endpoints, ~800 lines)
📊 Context estimate: ~45% used
💡 Checkpoint opportunity - recommend committing before tests

This is a good natural break point. Shall I commit the implementation before proceeding with tests?"

User: "Yes, commit then continue"

[AI commits, then continues with fresh context awareness]
```

## 🚦 Checkpoint Decision Flowchart

```
Major Component Complete?
    ├─ Yes → Check Context %
    │   ├─ <50% → Continue (note milestone)
    │   ├─ 50-70% → Suggest checkpoint
    │   └─ >70% → Strongly recommend checkpoint
    └─ No → Continue working
```

## 📋 Buffer Management Strategy

### Context Allocation

```
Total Context Window: 100%
├─ Implementation: 70%
├─ Buffer for Testing/Fixes: 20%
└─ Documentation/Commit: 10%
```

### Warning Levels

1. **Green (0-50%)**: Normal operation
2. **Yellow (50-70%)**: Consider checkpoints
3. **Orange (70-85%)**: Prioritize essentials
4. **Red (85%+)**: Minimal completion mode

## 🎯 Patterns for Different Session Types

### Pattern A: Large Implementation Session

```markdown
1. Start with realistic estimates
2. Break into 3-4 major components
3. Checkpoint after each component
4. Reserve 30% buffer
```

### Pattern B: Bug Fix/Enhancement Session

```markdown
1. Estimate based on scope analysis
2. Implement fix
3. Write tests
4. Update docs
5. Single checkpoint before final testing
```

### Pattern C: Documentation Session

```markdown
1. Lower token consumption rate
2. Can be more aggressive (80% usage)
3. Checkpoint less frequently
```

## 💡 Anti-Patterns to Avoid

### ❌ The "Just One More Thing" Pattern

```markdown
"✅ Core implementation complete (60% used)
Let me just add these extra features too..."
[Runs out of context at 95%]
```

### ❌ The "No Progress Updates" Pattern

```markdown
[Creates 5000 lines without any status updates]
"Oh, we're at 90% context..."
```

### ❌ The "Ignore the Buffer" Pattern

```markdown
"📊 85% used, but I'll finish everything..."
[Can't complete documentation or handle errors]
```

## ✅ Best Practices

1. **Conservative Estimates**: Better to overestimate context needs
2. **Early Checkpoints**: Commit working code even if incomplete
3. **Clear Communication**: Keep user informed of progress
4. **Flexible Planning**: Adapt when estimates prove wrong
5. **Buffer Respect**: Always maintain emergency context reserve

## 📊 Real Session Metrics

From actual sessions across various projects:

| Session Type | Planned Lines | Actual Lines | Context Used | Result |
|-------------|--------------|--------------|--------------|---------|
| Feature Implementation | 2000 | 2500 | 85% | Success |
| Database Schema | 3000 | 3500 | 90% | Success |
| Full Stack Feature | 3000 | 8500 | 99% | Near-crisis |
| Bug Fix | 500 | 300 | 25% | Success |
| Documentation | 1000 | 1200 | 40% | Success |

## 🔄 Recovery Strategies

When approaching context limits:

1. **Immediate Priority**: Ensure code is in working state
2. **Minimal Docs**: Create just enough documentation
3. **Quick Commit**: Save progress immediately
4. **Plan Continuation**: Note what remains for next session

## 📝 Session Continuation Template

When context is exhausted:

```markdown
## Session Continuation Required

### Completed:
- ✅ [Component 1]
- ✅ [Component 2]

### Remaining:
- [ ] [Component 3]
- [ ] Tests for [Component]
- [ ] Documentation updates

### Next Session Start:
"Continue from [specific point] with focus on [remaining tasks]"
```