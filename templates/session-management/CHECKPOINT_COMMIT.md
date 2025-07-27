# 💾 Checkpoint Commit Template

## Commit Message Format

```
[Session X.X] Checkpoint: [Component/Milestone] complete

## Status
- Context Usage: [XX]%
- Lines Created: [X,XXX]
- Tests: [X]/[X] passing
- Next: [What comes next]

## Completed
- [Component 1]: [Brief description]
- [Component 2]: [Brief description]
- [Tests/Docs]: [What was added]

## Changes
- [File category 1]: [What changed]
- [File category 2]: [What changed]

## Notes
- [Any important implementation detail]
- [Any temporary workaround]
- [Any known issue]

## Continue From
Session will continue with [next component/task]
Remaining context budget: [XX]%

🤖 Generated checkpoint
```

## Checkpoint Decision Guide

### When to Checkpoint

Create a checkpoint when:
- ✅ Major component is complete and tested
- ✅ Context usage reaches 60-70%
- ✅ Natural break point in implementation
- ✅ Before starting unrelated component
- ✅ Complex changes that work but need review
- ✅ End of time-boxed work period

### When NOT to Checkpoint

Avoid checkpoints when:
- ❌ Code doesn't compile or run
- ❌ Tests are failing
- ❌ In the middle of a logical change
- ❌ Temporary debug code is present
- ❌ Documentation is inconsistent with code

## Pre-Checkpoint Checklist

### Code State
- [ ] All syntax errors resolved
- [ ] Functions have proper returns
- [ ] No commented-out code blocks
- [ ] Debug statements removed
- [ ] TODOs are clearly marked

### Testing
- [ ] Unit tests for new code
- [ ] Existing tests still pass
- [ ] Edge cases considered
- [ ] Error handling in place

### Documentation
- [ ] Function docstrings updated
- [ ] README reflects changes
- [ ] API changes documented
- [ ] Complex logic commented

### Version Control
- [ ] Changes staged appropriately
- [ ] No sensitive data included
- [ ] Branch is up to date
- [ ] Commit message prepared

## Checkpoint Types

### 1. Feature Checkpoint
```
[Session X.X] Checkpoint: [Feature] implementation complete

Feature "[Feature Name]" is now functional with:
- Core logic implemented
- Basic tests passing
- API endpoints working
- Documentation updated

Ready for integration testing in next session.
```

### 2. Refactor Checkpoint
```
[Session X.X] Checkpoint: [Component] refactoring complete

Refactored [Component] for:
- Better performance ([metric])
- Cleaner architecture
- Improved maintainability

All tests passing, no functionality changes.
```

### 3. Foundation Checkpoint
```
[Session X.X] Checkpoint: Project foundation established

Created initial structure:
- Project layout complete
- Core models defined
- Basic infrastructure ready
- Development environment configured

Ready to implement features.
```

### 4. Integration Checkpoint
```
[Session X.X] Checkpoint: [System A] + [System B] integrated

Successfully connected:
- [System A] now talks to [System B]
- Data flow validated
- Error handling implemented
- Integration tests passing
```

### 5. Emergency Checkpoint
```
[Session X.X] Emergency Checkpoint: Context at [XX]%

PARTIAL IMPLEMENTATION:
- [What's complete]
- [What's partially done]
- [What's not started]

TODO: [Specific next steps]
ISSUE: [Any blocking problems]

Continue from [specific file/function]
```

## Post-Checkpoint Actions

### 1. Verify Checkpoint
```bash
# Verify code state
git status
git diff --staged

# Run quick tests
[test command]

# Check build
[build command]
```

### 2. Document Continuation Point
```markdown
## Next Session Start Point

Resume from:
- File: [filename]
- Function: [function name]
- Line: [approximate line]

Next task:
- [ ] [Specific next action]
- [ ] [Following action]

Context needed:
- [File 1]
- [File 2]
```

### 3. Update Progress Tracking
```markdown
## Progress Update

Checkpoint created at:
- Time: [timestamp]
- Context: [XX]% used
- Completed: [X]/[Y] planned items

Remaining work:
- [ ] [Item 1] (~[XXX] lines)
- [ ] [Item 2] (~[XXX] lines)
```

## Quick Checkpoint Commands

```bash
# Create checkpoint commit
git add .
git commit -m "[Session X.X] Checkpoint: [description]"

# Tag important checkpoints
git tag -a "checkpoint-session-X.X" -m "Major milestone: [description]"

# Push checkpoint
git push origin [branch]
git push --tags
```

## Checkpoint Recovery

If you need to return to a checkpoint:

```bash
# List checkpoints
git log --oneline --grep="Checkpoint"

# Return to checkpoint
git checkout [commit-hash]

# Create branch from checkpoint
git checkout -b continue-from-checkpoint [commit-hash]
```

## Best Practices

### DO:
- ✅ Keep checkpoint commits atomic
- ✅ Include context percentage in message
- ✅ Document what's NOT done
- ✅ Test before committing
- ✅ Make checkpoints recoverable

### DON'T:
- ❌ Checkpoint broken code
- ❌ Mix feature changes in checkpoint
- ❌ Forget to document continuation
- ❌ Skip testing
- ❌ Create huge checkpoint commits

Remember: A good checkpoint is like a game save - you should be able to pick up exactly where you left off.