# 🔍 Reality Check - [DATE]

## Executive Summary

**Overall Status**: 🟢 On Track | 🟡 Concerns | 🔴 Off Track  
**Documentation Accuracy**: [X]% aligned with reality  
**Technical Debt**: Low | Medium | High  
**Intervention Needed**: Yes | No

## 📊 Claims vs Reality

### Feature Status

| Feature | Claimed Status | Actual Status | Evidence | Gap |
|---------|---------------|---------------|----------|-----|
| [Feature 1] | Complete | 80% Complete | Tests failing on edge cases | 20% |
| [Feature 2] | In Progress | Not Started | No code files exist | 100% |
| [Feature 3] | Tested | Partially Tested | 5/20 tests written | 75% |

### Performance Metrics

| Metric | Claimed | Actual | Context | Valid? |
|--------|---------|--------|---------|--------|
| Response Time | <100ms | <100ms | Local only, no network | ⚠️ |
| Memory Usage | 50MB | 200MB | Full app, not module | ❌ |
| Throughput | 1000 req/s | 100 req/s | Single thread tested | ❌ |

### Test Coverage

| Component | Claimed Coverage | Actual Coverage | Notes |
|-----------|-----------------|-----------------|-------|
| Core Module | 95% | 95% | ✅ Accurate |
| API Layer | 80% | 0% | Tests exist but don't run |
| Database | 90% | N/A | No DB tests possible yet |

## 🔴 Critical Gaps

### 1. [Gap Title]
- **Claimed**: [What documentation says]
- **Reality**: [What actually exists]
- **Impact**: [How this affects project]
- **Fix**: [What needs to be done]
- **Effort**: [Hours/days estimate]

### 2. [Gap Title]
- **Claimed**: [What documentation says]
- **Reality**: [What actually exists]
- **Impact**: [How this affects project]
- **Fix**: [What needs to be done]
- **Effort**: [Hours/days estimate]

## 🟡 Minor Discrepancies

### 1. [Discrepancy Title]
- **Issue**: [What's inconsistent]
- **Risk**: Low | Medium | High
- **Action**: [Recommended action]

## ✅ Accurate Claims

These claims have been verified as accurate:

1. **[Claim 1]**: [Verification method]
2. **[Claim 2]**: [Verification method]
3. **[Claim 3]**: [Verification method]

## 📈 Trend Analysis

### Documentation Drift Over Time

| Date | Accuracy | Major Gaps | Notes |
|------|----------|------------|-------|
| [Date 1] | 90% | 2 | Initial optimism |
| [Date 2] | 75% | 5 | Reality setting in |
| [Date 3] | 60% | 8 | Current state |

### Patterns Observed

1. **Over-optimistic estimates**: Features take 2-3x longer
2. **Test coverage inflation**: Counting files, not execution
3. **Performance cherry-picking**: Best-case scenarios only

## 🔧 Corrective Actions

### Immediate (This Week)

1. [ ] Update README to reflect actual feature status
2. [ ] Add context to all performance metrics
3. [ ] Remove claims about untested features
4. [ ] Document known limitations prominently

### Short-term (This Month)

1. [ ] Implement automated reality checking
2. [ ] Create accurate progress tracking
3. [ ] Fix test environment issues
4. [ ] Update all documentation

### Long-term (This Quarter)

1. [ ] Establish documentation review process
2. [ ] Implement continuous validation
3. [ ] Create living documentation
4. [ ] Regular reality check schedule

## 💡 Lessons Learned

### What Led to Drift

1. **[Cause 1]**: [How it happened]
2. **[Cause 2]**: [How it happened]
3. **[Cause 3]**: [How it happened]

### Prevention Strategies

1. **Strategy 1**: [How to prevent]
2. **Strategy 2**: [How to prevent]
3. **Strategy 3**: [How to prevent]

## 📊 Validation Methods Used

### Code Analysis
```bash
# Files claimed vs actual
find . -name "*.py" | wc -l  # 45 files
grep -r "class\|def" | wc -l  # 234 functions

# Tests runnable vs existing
pytest --collect-only  # 45 tests found
pytest -v  # 12 tests pass, 33 fail
```

### Performance Testing
```bash
# Actual performance test
python benchmark.py
# Results: 200ms average (not <100ms claimed)
```

### Feature Probing
```python
# API endpoint testing
for endpoint in claimed_endpoints:
    response = test_endpoint(endpoint)
    print(f"{endpoint}: {response.status}")
# Result: 60% return 404 or 500
```

## 🎯 Success Criteria for Next Check

By next reality check, achieve:

- [ ] Documentation accuracy > 90%
- [ ] All performance metrics include context
- [ ] Test coverage based on execution
- [ ] No features claimed unless working
- [ ] Known issues section in all docs

## 📝 Notes

### Stakeholder Communication
- [What was communicated to stakeholders]
- [How reality differs from communication]
- [Recommended messaging update]

### Technical Debt Assessment
- **Current Debt**: [Description]
- **Accumulation Rate**: [How fast growing]
- **Critical Threshold**: [When action needed]

### Risk Assessment
- **Documentation Risk**: [Low|Medium|High]
- **Technical Risk**: [Low|Medium|High]
- **Timeline Risk**: [Low|Medium|High]

## 🔄 Next Reality Check

**Scheduled**: [Date]  
**Focus Areas**:
1. [Area 1]
2. [Area 2]
3. [Area 3]

**Validation Checklist**:
- [ ] Re-run all benchmarks
- [ ] Test all claimed features
- [ ] Verify all documentation claims
- [ ] Check dependency updates
- [ ] Review test coverage

---

**Generated**: [Timestamp]  
**Generated By**: [Person/Script]  
**Review Status**: [ ] Pending | [X] Reviewed | [ ] Approved