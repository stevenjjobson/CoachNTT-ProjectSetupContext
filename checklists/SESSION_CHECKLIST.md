# 📋 Session Development Checklist

## 🚀 Before Starting Any Session

### Pre-Session (5 minutes)
- [ ] Run `make verify` to check environment
- [ ] Review NEXT_SESSION.md for goals
- [ ] Check git status (clean working directory?)
- [ ] Start required services (DB, Docker, etc.)
- [ ] Have coffee/tea ready ☕

### Context Loading (2 minutes)
```markdown
# Minimal context template:
I'm continuing [PROJECT] Session [X.Y] ([Session Name]).

Context from last session:
- Completed: [what was done]
- Decision: [key decision made]
- Pattern: [established pattern]

Loading:
@CLAUDE.md (lines 50-150)
@Implementation_Cadence.md (Session X.Y)
@[specific file for this session]

Ready to [specific task].
```

## 📝 During the Session

### Every 30 Minutes
- [ ] Commit progress (even if WIP)
- [ ] Run tests
- [ ] Check context usage
- [ ] Take a short break

### Task Completion Pattern
For each task in the session:
1. [ ] Read the requirement
2. [ ] Write the test first (if applicable)
3. [ ] Implement the solution
4. [ ] Verify tests pass
5. [ ] Update documentation
6. [ ] Mark complete in checklist

### When Stuck
- [ ] Check PATTERNS.md for similar solutions
- [ ] Review completed features for examples
- [ ] Load additional context if needed
- [ ] Document the challenge for future reference

## 🎯 Session Checkpoints

### Mid-Session Checkpoint (1.5 hours)
- [ ] Review progress against checklist
- [ ] All tests passing?
- [ ] Documentation updated?
- [ ] Any decisions to record?
- [ ] Context still efficient? (<80% usage)

### End-Session Checkpoint (2.5 hours)
- [ ] All checkpoint criteria met?
- [ ] Code committed and pushed?
- [ ] SESSION_LOG.md updated?
- [ ] NEXT_SESSION.md prepared?
- [ ] Handoff notes created?

## 📊 Post-Session (10 minutes)

### Update Documentation
```markdown
# SESSION_LOG.md entry template:
## Session X.Y: [Session Name]
**Date**: [YYYY-MM-DD]
**Duration**: ~X hours
**Status**: ✅ Complete

### Completed Tasks:
- [x] [Specific task]
- [x] [Another task]
- [x] **Checkpoint**: [What was validated]

### Key Decisions:
- **[Topic]**: [Decision and why]

### Metrics:
- Files created: X
- Tests written: Y
- Coverage: Z%
- Context efficiency: XX%

### Notes for Next Session:
- [Important context]
- [Open question]
```

### Prepare Handoff
```markdown
# NEXT_SESSION.md update:
## Session X.Y: [Next Session Name]

Ready to copy for next session:
"""
I'm continuing [PROJECT]. We completed Session X.Y.

Please review:
1. @CLAUDE.md
2. @Implementation_Cadence.md (Session X.Y)
3. @[relevant file]

Ready to start Session X.Y: [Name].
"""
```

### Final Tasks
- [ ] Run `make context-summary`
- [ ] Create handoff file
- [ ] Push all changes
- [ ] Close development environment
- [ ] Plan next session time

## 🔥 Quick Commands

```bash
# Start session
make session SESSION=X.Y

# During session
make test          # Run tests
make lint          # Check code
make save          # Commit WIP

# End session
make context-summary    # Summarize work
make context-handoff    # Prepare handoff
make session-complete   # Full cleanup
```

## 📈 Quality Checks

### Code Quality
- [ ] No commented-out code
- [ ] Meaningful variable names
- [ ] Functions < 20 lines
- [ ] Files < 200 lines
- [ ] Test coverage increasing

### Documentation Quality
- [ ] Functions have docstrings
- [ ] Complex logic explained
- [ ] TODOs have context
- [ ] API changes documented
- [ ] Examples updated

### Context Quality
- [ ] Using line-specific loads
- [ ] Avoiding generated files
- [ ] Pattern library updated
- [ ] Handoff is clear
- [ ] Next session prepared

## 🚨 Warning Signs

Stop and reassess if:
- Context usage > 85%
- Tests failing for > 30 min
- Scope creeping beyond session
- Making architectural changes
- Energy/focus dropping

## 💡 Efficiency Tips

### Save Context
- Use `(lines X-Y)` for partial loads
- Reference patterns, don't reload
- Summarize completed work
- Cache common solutions

### Save Time
- Scaffold don't hand-write
- Use snippets and templates
- Commit early and often
- Test continuously

### Save Energy
- Take breaks every hour
- Switch tasks if stuck
- Document while fresh
- End on a success

## 🎯 Session Success Criteria

A successful session has:
- ✅ All checkpoint tasks complete
- ✅ Tests passing
- ✅ Documentation updated
- ✅ Clean git history
- ✅ Clear handoff for next time
- ✅ Progress tracked
- ✅ Decisions recorded
- ✅ Energy maintained

---

*Print this checklist and check off items during each session!*