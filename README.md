# Manus Claude Orchestrator

> The first skill to connect [Manus Desktop](https://manus.im/invitation/LM102IK4RRBDDY) and [Claude Code](https://claude.ai/code).
> Turn Manus into a CEO that drives your coding sessions.

## Why This Exists

**Manus thinks. Claude codes. But they don't talk to each other.**

Manus Desktop has a "My Computer" feature that can operate your terminal — including Claude Code's REPL. This skill gives Manus the playbook it needs to orchestrate Claude Code like a CEO directing an engineering team.

Without this skill, Manus types into Claude Code blindly. With it, Manus follows a structured protocol: planning before coding, policy-driven approvals, safety guards, and continuous improvement.

## What You Get

- **Session Lifecycle** — 6-phase deterministic pipeline from start to finish
- **Policy-Driven Approvals** — YAML config controls what Manus auto-approves, asks once, or always denies
- **Task Templates** — 5 structured templates (feature, bug fix, refactor, review, project phase)
- **Safety Guards** — Git protection, cost limits, escalation triggers, secret management
- **Self-Improvement Loop** — Post-session retros that evolve your policy over time
- **Dialogue Protocol** — Battle-tested interaction patterns for every situation

## Prerequisites

- [Manus Desktop](https://manus.im/invitation/LM102IK4RRBDDY) — AI agent with computer control
- [Claude Code](https://claude.ai/code) — Anthropic's CLI for Claude

> **New to Manus?** [Get access here](https://manus.im/invitation/LM102IK4RRBDDY) — it's worth it for the "My Computer" capability alone.

## Quick Install

```bash
# Option 1: npx skills (recommended)
npx skills add kazuya-hibara/manus-claude-orchestrator

# Option 2: Manual
git clone https://github.com/kazuya-hibara/manus-claude-orchestrator.git ~/.agents/skills/manus-orchestrator
```

## Quick Start (5 min)

See [examples/quickstart.md](examples/quickstart.md) for a step-by-step guide.

**TL;DR:**
1. Copy `assets/manus-instructions.md` into Manus Desktop → Instructions
2. Open a terminal in Manus and run `claude --dangerously-skip-permissions`
3. Manus will follow the Session Lifecycle automatically

## Architecture

```
┌─────────────────────────────────────────────┐
│                 Manus Desktop               │
│  ┌─────────────┐  ┌──────────────────────┐  │
│  │ Instructions │  │   "My Computer"      │  │
│  │ (CEO brain)  │  │   Terminal Control   │  │
│  └──────┬──────┘  └──────────┬───────────┘  │
│         │    Decisions       │  Types into   │
│         └────────┬───────────┘  terminal     │
└──────────────────┼──────────────────────────┘
                   │ stdin/stdout
┌──────────────────┼──────────────────────────┐
│          Claude Code REPL                    │
│  ┌────────────────────────────────────────┐  │
│  │  Skills · Teams · Agent · Plan Mode    │  │
│  │  (all CC features work as normal)      │  │
│  └────────────────────────────────────────┘  │
└──────────────────────────────────────────────┘
```

**Key insight**: Manus uses the same terminal interface as a human. No API integration needed — it just types and reads.

## File Structure

```
manus-claude-orchestrator/
├── SKILL.md                          # Skill definition (entry point)
├── assets/
│   ├── manus-instructions.md         # Paste into Manus Instructions
│   ├── policy.yaml                   # All judgment criteria (soft-coded)
│   └── task-templates/
│       ├── bug-fix.md
│       ├── new-feature.md
│       ├── project-phase.md
│       ├── refactor.md
│       └── review.md
├── reference/
│   ├── dialogue-protocol.md          # Interaction patterns
│   ├── improvement-loop.md           # Self-improvement mechanism
│   ├── safety-guards.md              # Safety architecture
│   └── workflow-integration.md       # Project workflow coordination
├── scripts/
│   ├── start-session.sh              # Session launcher
│   ├── session-log.sh                # Session logger
│   └── validate-policy.sh            # Policy validator
└── examples/
    ├── quickstart.md                  # 5-min getting started
    └── advanced-session.md            # Full session walkthrough
```

## Customization

### Policy (Most Important)
Edit `assets/policy.yaml` to match your workflow:
- `approval.always_allow` — operations Manus auto-approves
- `approval.always_deny` — operations always blocked
- `session.max_cost_usd` — per-session budget cap
- `escalation.triggers` — when to pause and ask a human

### Task Templates
Add your own templates in `assets/task-templates/`. Manus will use the Intent Dispatch Table in SKILL.md to route tasks.

### Dialogue Patterns
Extend `reference/dialogue-protocol.md` with patterns specific to your workflow.

## How It Works (for the curious)

1. You paste `manus-instructions.md` into Manus Desktop's Instructions field
2. You tell Manus your goal (e.g., "Build a REST API for user management")
3. Manus launches `claude --dangerously-skip-permissions` in your project
4. Manus enters Plan Mode, reviews Claude's plan, approves or adjusts
5. Claude executes. Manus approves operations based on `policy.yaml`
6. On errors: Manus follows the dialogue protocol (retry → alternative → STOP)
7. On completion: Manus reviews deliverables, runs retro, logs session

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)

---

Built by [@kazuya-hibara](https://github.com/kazuya-hibara) | [Get Manus Desktop](https://manus.im/invitation/LM102IK4RRBDDY)
