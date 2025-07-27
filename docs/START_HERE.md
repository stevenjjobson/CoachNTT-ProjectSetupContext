# 🎯 Copy This to Start a New Project

## For Users: Simple Setup Instructions

When you want to start a new project with Claude Code, simply copy and paste this message:

---

```markdown
I want to start a new project with the following details:

Project Name: [YOUR PROJECT NAME]
Project Type: [e.g., Web API, React App, CLI Tool, Library]
Primary Language: [e.g., TypeScript, Python, Go]
Key Technologies: [e.g., Express, GraphQL, PostgreSQL, Redis]

Main Features:
1. [Feature 1]
2. [Feature 2]  
3. [Feature 3]

Please use the complete ProjectSetupContext system to:
1. Set up the project structure
2. Customize all templates for my tech stack
3. Create the session-based workflow
4. Prepare everything for Session 0.1

Use the templates from:
- templates/core/ - for workflow files
- templates/session-management/ - for session tracking
- templates/project/ - for project setup files

Please follow the SETUP_INSTRUCTIONS.md and create a production-ready project structure.
```

---

## What Happens Next

Claude Code will:

1. **Load the ProjectSetupContext system**
2. **Understand your requirements**
3. **Create a complete project structure**
4. **Customize all templates**
5. **Set up the development workflow**
6. **Prepare your first session**
7. **Give you clear next steps**

## Your First Session

After setup, you'll get instructions like:

```bash
# Verify everything is ready
make verify

# Start your first session
make session SESSION=0.1

# Your first session prompt for Claude Code:
"I'm starting [PROJECT_NAME] Session 0.1. Please review:
1. @CLAUDE.md
2. @Implementation_Cadence.md (Session 0.1)
3. @verify_setup.py

Ready to implement the project foundation."
```

## Tips for Best Results

1. **Be Specific**: The more details you provide, the better the setup
2. **List Features**: 3-5 main features help shape the roadmap
3. **Mention Special Needs**: Authentication? Real-time? Scaling?
4. **Tech Stack Clarity**: Specify versions if important
5. **Project Type**: API vs App vs Library changes the structure

## Example Request

```markdown
I want to start a new project with the following details:

Project Name: EventStream
Project Type: Real-time Event Processing API
Primary Language: TypeScript
Key Technologies: Node.js, Apache Kafka, WebSockets, PostgreSQL, Redis

Main Features:
1. REST API for event ingestion with rate limiting
2. Real-time event streaming via WebSockets
3. Event persistence and replay capabilities
4. Multi-tenant support with isolation
5. Admin dashboard for monitoring

Please use the complete ProjectSetupContext system from my Obsidian templates to set up this project with session-based development workflow.
```

## Why This Works

- **Structured Approach**: No more ad-hoc development
- **Context Efficient**: 40-60% less token usage
- **Quality First**: Testing and docs from day one
- **Clear Progress**: Always know what's next
- **AI Optimized**: Designed for Claude Code

---

*Start your next project the right way with ProjectSetupContext!*