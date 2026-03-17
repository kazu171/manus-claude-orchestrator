---
name: manus-claude-orchestrator
description: >
  Manus Desktop → Claude Code interactive orchestration.
  Position Manus as the CEO/COO layer in your Claude Code REPL.
  Intent Dispatch for task routing, Session Lifecycle for progress management,
  Policy YAML for approval and escalation control.
  Use when: manus, manus-orchestrator, manus session, manus setup, manus start.
  NOT for: Non-Manus development sessions.
user-invocable: true
allowed-tools:
  - Bash, Read, Write, Edit, Grep, Glob, Agent, Skill, AskUserQuestion
---

# Manus Claude Orchestrator

Connect Manus Desktop as a CEO/COO to your Claude Code REPL.
Manus interacts through terminal I/O using the same interface as a human user.
All existing Claude Code capabilities (Skills, Teams, Agent) work seamlessly.

## Scope Guard

**USE**: Design, launch, operate, and improve Manus Desktop sessions
**NOT FOR**: Non-Manus development sessions

## Intent Dispatch Table

| Manus Intent | Action | Template |
|-------------|--------|----------|
| New feature | Inject task template | `assets/task-templates/new-feature.md` |
| Bug fix | Inject task template | `assets/task-templates/bug-fix.md` |
| Refactoring | Inject task template | `assets/task-templates/refactor.md` |
| Code review | Inject task template | `assets/task-templates/review.md` |
| Project phase execution | Use project plan | `assets/task-templates/project-phase.md` |
| Check progress | `git log` or project notes | — |
| Error handling | Refer to dialogue protocol | `reference/dialogue-protocol.md` |

## Execution Model

- **CC Launch**: `ccd` (`claude --dangerously-skip-permissions`) = Bypass mode
- **CC Guards**: Disabled (no approval dialogs)
- **Safety Layer**: Manus is the sole decision-maker. `policy.yaml` defines judgment criteria
- **Start Procedure**: Always begin with **Plan Mode**. Implement in Bypass mode after plan approval

## Session Lifecycle

A deterministic 6-phase pipeline. See each reference for details.

```
SESSION_START → PLAN_MODE → TASK_DELEGATION → INTERACTIVE_EXECUTION → REVIEW_AND_ITERATE → SESSION_END
```

### Phase 1: SESSION_START
1. Launch CC with `ccd` in the project directory
2. Manus instructs CC to check CLAUDE.md
3. Set goals (task or project phase)

### Phase 2: PLAN_MODE (Required)
1. First message enters **Plan Mode**
2. CC writes goals, plan, and verification method to the plan file
3. Manus reviews plan → approve / feedback / reject
4. After approval → begin implementation in Bypass mode

### Phase 3: TASK_DELEGATION
1. Determine task type via Intent Dispatch Table
2. Inject the corresponding `assets/task-templates/` template
3. Specify acceptance criteria

### Phase 4: INTERACTIVE_EXECUTION
1. Read CC responses → Manus makes autonomous decisions
2. Refer to `assets/policy.yaml` `approval` section (Manus internal criteria)
3. Answer AskUserQuestion based on policy
4. **Note**: In Bypass mode, CC-side approval dialogs are disabled. Manus is the sole safety layer

### Phase 5: REVIEW_AND_ITERATE
1. Verify deliverables (test results, diffs, behavior)
2. Provide additional instructions or move to next task

### Phase 6: SESSION_END
1. Check git commit status
2. Session retrospective → `reference/improvement-loop.md`
3. Save logs with `scripts/session-log.sh`

## Stop / Continue Rules

### STOP (Escalate to human)
- Destructive operations on production
- Security-related decisions
- Matches `policy.yaml` `escalation.triggers`
- Cost limit reached
- 3 consecutive errors

### CONTINUE (Manus decides autonomously)
- File read/write approvals
- Test execution approvals
- Git feature branch operations
- Routine operations within a planned project phase
- Package installs (after ask_once)

## Policy Reference

All judgment criteria are externalized to `assets/policy.yaml`. No hardcoding.
- Approval policies: `approval` section
- Escalation: `escalation` section
- Session limits: `session` section
- Workflow integration: `workflow` section

## Reference Architecture

| File | Contents |
|------|----------|
| `reference/dialogue-protocol.md` | Interaction pattern catalog |
| `reference/safety-guards.md` | Safety guard design |
| `reference/workflow-integration.md` | Project workflow and Agent Teams coordination |
| `reference/improvement-loop.md` | Self-improvement mechanism |

## Response Rules

1. On `/manus-orchestrator` invocation → execute session preparation checklist
2. On template injection → fill project-specific values before injecting
3. On escalation → use 4-part format: Context + Question + Recommendation + Options
