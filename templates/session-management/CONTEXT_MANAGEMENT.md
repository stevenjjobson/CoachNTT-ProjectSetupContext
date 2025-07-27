# 🎯 Context Management: Token Tracking & Optimization

## Overview

This guide provides strategies for managing context windows (token limits) during AI-assisted development sessions. Effective context management prevents session interruption and ensures completion of complex tasks.

## 📊 Understanding Context Windows

### What Are Tokens?

Tokens are the basic units AI models use to process text:
- Average: ~4 characters = 1 token
- Word: ~1.3 tokens per word
- Code: ~1 token per 3-5 characters (varies by language)

### Typical Window Sizes

| Model Type | Context Window | Approx. Lines of Code |
|------------|---------------|----------------------|
| Small | 4K tokens | ~500-800 lines |
| Medium | 16K tokens | ~2,000-3,200 lines |
| Large | 32K tokens | ~4,000-6,400 lines |
| Extra Large | 100K+ tokens | ~12,500-20,000 lines |

## 📈 Token Estimation Strategies

### 1. Quick Estimation Formula

```
Tokens ≈ (Characters ÷ 4) × 1.2
```

Add 20% buffer for:
- AI responses
- Formatting
- System messages

### 2. Content-Specific Ratios

Based on empirical data:

```python
TOKEN_RATIOS = {
    "python_code": 0.25,      # 1 token per 4 chars
    "javascript": 0.28,       # Slightly more verbose
    "sql": 0.20,             # Compact syntax
    "markdown": 0.30,        # Mixed content
    "json": 0.22,           # Structured data
    "yaml": 0.24,           # Config files
    "html": 0.35,           # Tags add overhead
    "css": 0.26,            # Selectors and rules
}

def estimate_tokens(content, content_type="python_code"):
    """Estimate token count for content"""
    char_count = len(content)
    ratio = TOKEN_RATIOS.get(content_type, 0.25)
    return int(char_count * ratio * 1.2)  # 20% buffer
```

### 3. Line-Based Estimation

Quick estimates for planning:

| File Type | Avg Tokens/Line | Lines per 1K Tokens |
|-----------|----------------|-------------------|
| Python | 8-12 | 80-125 |
| JavaScript | 10-15 | 65-100 |
| SQL/DDL | 6-10 | 100-165 |
| Markdown | 12-18 | 55-85 |
| JSON | 8-12 | 80-125 |
| Tests | 10-14 | 70-100 |

## 🎮 Context Management Strategies

### 1. Progressive Loading

Start minimal, expand as needed:

```markdown
## Initial Load (~500 tokens)
- Session goal
- Key interfaces/types
- Current task focus

## As Needed (~200-500 tokens each)
- Specific file content
- Related functions
- Test cases
- Documentation
```

### 2. Context Budget Allocation

Plan your token spending:

```markdown
## Session Budget: 16K tokens

### Allocation:
- Initial context: 2K (12.5%)
- Implementation: 8K (50%)
- Tests: 3K (18.75%)
- Documentation: 1K (6.25%)
- Buffer: 2K (12.5%)

### Checkpoints:
- [ ] 25% - First component complete
- [ ] 50% - Core implementation done
- [ ] 70% - Tests written
- [ ] 85% - Documentation added
- [ ] 95% - Emergency wrap-up
```

### 3. Context Window Stages

Different strategies at different usage levels:

```python
def get_context_strategy(usage_percent):
    """Return strategy based on context usage"""
    if usage_percent < 50:
        return "NORMAL"      # Full responses, detailed code
    elif usage_percent < 70:
        return "EFFICIENT"   # Concise code, less explanation
    elif usage_percent < 85:
        return "COMPACT"     # Minimal comments, essential only
    else:
        return "CRITICAL"    # Emergency completion mode
```

## 📉 Context Reduction Techniques

### 1. Code Compaction

When context is limited:

```python
# Verbose (more tokens)
def calculate_user_score(user_activities, weight_config):
    """
    Calculate the user's score based on their activities.
    
    Args:
        user_activities: List of user activity objects
        weight_config: Dictionary of activity weights
        
    Returns:
        float: The calculated user score
    """
    total_score = 0.0
    
    for activity in user_activities:
        activity_type = activity.get('type')
        activity_value = activity.get('value', 0)
        
        if activity_type in weight_config:
            weight = weight_config[activity_type]
            score = activity_value * weight
            total_score += score
            
    return total_score

# Compact (fewer tokens)
def calculate_user_score(activities, weights):
    return sum(
        a.get('value', 0) * weights.get(a.get('type'), 0)
        for a in activities
    )
```

### 2. Summary Replacements

Replace verbose content with summaries:

```markdown
## Instead of full file content:
[Include 500 lines of code]

## Use summary:
File: user_service.py
Functions: create_user(), update_user(), delete_user()
Classes: UserService (CRUD operations)
Dependencies: database, validators, models
Key patterns: Repository pattern, validation decorators
```

### 3. Selective Inclusion

Include only what's needed:

```python
# Don't include entire class
class LargeClass:
    def method1(self): ...  # 50 lines
    def method2(self): ...  # 50 lines
    def method3(self): ...  # 50 lines
    def method4(self): ...  # 50 lines

# Include only relevant method
def method2(self):
    """The method we're actually working on"""
    # ... implementation
```

## 🔧 Context Monitoring Tools

### 1. Token Counter Script

```python
#!/usr/bin/env python3
"""Monitor token usage during development"""

import tiktoken  # OpenAI's token counter

def count_tokens(text, model="gpt-4"):
    """Count tokens in text"""
    encoding = tiktoken.encoding_for_model(model)
    return len(encoding.encode(text))

def analyze_project_tokens(directory):
    """Analyze token usage for project files"""
    total_tokens = 0
    file_tokens = {}
    
    for filepath in Path(directory).rglob("*.py"):
        content = filepath.read_text()
        tokens = count_tokens(content)
        file_tokens[filepath] = tokens
        total_tokens += tokens
    
    return {
        "total_tokens": total_tokens,
        "file_tokens": file_tokens,
        "largest_files": sorted(
            file_tokens.items(), 
            key=lambda x: x[1], 
            reverse=True
        )[:10]
    }
```

### 2. Context Usage Tracker

```markdown
## Session Context Tracker

| Action | Tokens Added | Total | % Used | Notes |
|--------|-------------|-------|--------|-------|
| Initial context | 500 | 500 | 3% | Goals and setup |
| Load user_service.py | 800 | 1,300 | 8% | Core implementation |
| Create models | 1,200 | 2,500 | 16% | Generated code |
| Add tests | 1,500 | 4,000 | 25% | Test suite |
| Load dependencies | 600 | 4,600 | 29% | Related files |
| Implementation | 3,000 | 7,600 | 48% | Main work |
| Documentation | 800 | 8,400 | 53% | API docs |
```

### 3. Real-time Monitoring

```python
class ContextMonitor:
    """Monitor context usage in real-time"""
    
    def __init__(self, max_tokens=16000):
        self.max_tokens = max_tokens
        self.used_tokens = 0
        self.history = []
    
    def add_content(self, content, description=""):
        """Track new content added to context"""
        tokens = count_tokens(content)
        self.used_tokens += tokens
        self.history.append({
            "description": description,
            "tokens": tokens,
            "total": self.used_tokens,
            "percentage": (self.used_tokens / self.max_tokens) * 100
        })
        
        # Alert if crossing thresholds
        percentage = (self.used_tokens / self.max_tokens) * 100
        if percentage > 70 and percentage - tokens < 70:
            print("⚠️ WARNING: Context usage above 70%")
        elif percentage > 85 and percentage - tokens < 85:
            print("🚨 CRITICAL: Context usage above 85%")
    
    def get_status(self):
        """Get current context status"""
        percentage = (self.used_tokens / self.max_tokens) * 100
        return {
            "used": self.used_tokens,
            "max": self.max_tokens,
            "percentage": percentage,
            "remaining": self.max_tokens - self.used_tokens,
            "status": self._get_status_level(percentage)
        }
```

## 🚀 Optimization Patterns

### 1. Chunked Processing

Break large tasks into context-friendly chunks:

```python
def process_large_dataset(data, chunk_size=1000):
    """Process data in chunks to manage context"""
    results = []
    
    for i in range(0, len(data), chunk_size):
        chunk = data[i:i + chunk_size]
        # Process chunk
        result = process_chunk(chunk)
        results.extend(result)
        
        # Clear context between chunks if needed
        if i % (chunk_size * 5) == 0:
            yield "CHECKPOINT"  # Signal to save progress
    
    return results
```

### 2. Context Recycling

Reuse context across related tasks:

```markdown
## Context Recycling Strategy

### Base Context (reused)
- Core interfaces
- Common utilities
- Shared types

### Task-Specific Context (swapped)
Task 1: Feature A implementation
Task 2: Feature B implementation  
Task 3: Integration tests

Each task reuses base + adds specific
```

### 3. Lazy Loading

Load only when needed:

```python
class LazyContextLoader:
    """Load content only when accessed"""
    
    def __init__(self):
        self._cache = {}
        
    def get_file(self, filepath):
        """Load file content on demand"""
        if filepath not in self._cache:
            # Only load if actually needed
            self._cache[filepath] = Path(filepath).read_text()
        return self._cache[filepath]
    
    def get_function(self, filepath, function_name):
        """Extract specific function"""
        content = self.get_file(filepath)
        # Parse and return only the function
        return extract_function(content, function_name)
```

## 📋 Context Management Checklist

### Before Session

- [ ] Estimate total lines/tokens needed
- [ ] Plan context budget allocation
- [ ] Identify checkpoint opportunities
- [ ] Prepare minimal initial context
- [ ] Set up monitoring tools

### During Session

- [ ] Track token usage at milestones
- [ ] Update progress at 25% intervals
- [ ] Watch for threshold warnings
- [ ] Prepare for checkpoints early
- [ ] Keep buffer for emergencies

### At Thresholds

- [ ] 50%: Review remaining work
- [ ] 70%: Consider checkpoint
- [ ] 85%: Switch to essential mode
- [ ] 90%: Emergency completion
- [ ] 95%: Save and stop

## 💡 Pro Tips

### 1. Context-Aware Coding Style

When context is precious:

```python
# Use more compact styles
data = [process(x) for x in items if valid(x)]

# Instead of
processed_data = []
for item in items:
    if valid(item):
        processed_item = process(item)
        processed_data.append(processed_item)
```

### 2. Strategic Documentation

Place docs where they matter:

```python
# Don't document obvious things
x = x + 1  # DON'T: Increment x by 1

# DO document complex logic
score = (base * weight) / (1 + decay ** days)  # Exponential decay scoring
```

### 3. Context-Efficient Communication

Be concise in responses:

```markdown
## Instead of:
"I understand your request. Let me create a comprehensive solution
that addresses all your requirements. First, I'll start by..."

## Use:
"Creating solution. Starting with models..."
```

## 🎯 Quick Reference

### Token Rules of Thumb

- 1 token ≈ 4 characters
- 1 line of code ≈ 10 tokens
- 1 function ≈ 100-500 tokens
- 1 class ≈ 500-2000 tokens
- 1 module ≈ 1000-5000 tokens

### Context Stages

| Usage | Stage | Strategy |
|-------|-------|----------|
| 0-50% | Green | Normal development |
| 50-70% | Yellow | Plan checkpoints |
| 70-85% | Orange | Essential only |
| 85-95% | Red | Emergency mode |
| 95%+ | Critical | Stop and save |

### Emergency Actions

1. Stop new development
2. Ensure code compiles
3. Add minimal TODOs
4. Commit immediately
5. Plan continuation

Remember: Good context management is invisible when done right but critical when ignored.