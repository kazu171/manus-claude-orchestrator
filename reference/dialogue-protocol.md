# Dialogue Protocol — Interaction Pattern Catalog

Standard patterns for Manus Desktop interacting with the Claude Code REPL.

## 1. Session Start Patterns

### 1.1 New Project Start (Plan Mode First)
```
[Launch CC with ccd in the project directory]
Manus → CC: "Check this project's CLAUDE.md and show me the current state.
We'll proceed in Plan Mode."
CC → Manus: [Project state summary + Plan Mode started]
Manus → CC: "In this session we will achieve [goal]. Create a plan."
CC → Manus: [Plan file created → ExitPlanMode]
Manus: [Review plan → approve/feedback]
CC: [After approval, begin implementation in Bypass mode]
```

### 1.2 Resume Existing Session (Plan Mode First)
```
[Launch CC with ccd]
Manus → CC: "Resume from last session — verify the approach in Plan Mode before proceeding"
CC → Manus: [Previous work context restored + Plan]
Manus: [Approve plan]
CC: [Resume implementation]
```

### 1.3 Quick Task (Plan Mode Optional)
```
[Launch CC with ccd]
Manus → CC: "[specific instruction] — handle this as a quick task"
```

## 2. Approval Judgment Patterns

### 2.1 Tool Approval Requests
When CC requests tool approval:

| Request | Response | Basis |
|---------|----------|-------|
| File read/write | "Yes" or "Allow" | always_allow |
| Test execution | "Yes" | always_allow |
| git commit/branch | "Yes" | always_allow |
| Package install | First-time check → then "Yes" | ask_once |
| External API call | First-time check → then "Yes" | ask_once |
| git force push | "No — force push is prohibited" | always_deny |
| Production deploy | "No — human approval required" | always_deny |

### 2.2 AskUserQuestion Responses
When CC asks a question:

1. **Read the question** — understand precisely what is being asked
2. **Reference policy.yaml** — check if a matching policy exists
3. **Decide**:
   - Can answer clearly → respond (include recommended option + reasoning)
   - Cannot decide → STOP + escalate to human
4. **Response format**: Use number/label to answer clearly when options are provided

### 2.3 Plan Mode Responses
When CC requests Plan Mode approval:

1. **Read the entire plan** — check every step
2. **Checkpoints**:
   - Alignment with goals
   - Appropriate scope (not over-engineered)
   - No security risks
   - Test strategy included
3. **Response**:
   - No issues → approval message
   - Changes needed → specific feedback (what to change and how)
   - Fundamental problem → reject + suggest alternative approach

## 3. Error Handling Patterns

### 3.1 CC Reports an Error
```
Manus → CC: "Analyze the root cause. Check:
1. Full error message
2. Related logs
3. Recent changes"
```

### 3.2 Consecutive Errors (2nd attempt)
```
Manus → CC: "Try a different approach. Summarize the problems with the
current approach and propose 2-3 alternatives"
```

### 3.3 Consecutive Errors (3rd) — STOP
```
Manus → CC: "Pause work. Save the current state"
[STOP] Escalate to human
Reason: 3 consecutive errors
Status: [error summary]
```

## 4. Direction Change Patterns

### 4.1 Scope Change
```
Manus → CC: "Commit work so far.
Changing direction to [new direction]. Reason: [explanation]"
```

### 4.2 Priority Change
```
Manus → CC: "Pause the current task.
Addressing [urgent task] first. Commit and document current state."
```

### 4.3 Session Interruption
```
Manus → CC: "Ending this session.
1. Commit any uncommitted changes
2. Document current work state for next session
3. Summarize what's needed to resume"
```

## 5. Context Management Patterns

### 5.1 Context Compression
When CC context usage approaches 50%:
```
Manus → CC: "/compact"
```

### 5.2 Large Task Splitting
When a task is too large:
```
Manus → CC: "Split this task into 3-5 subtasks.
Each subtask should be independently completable and testable"
```

### 5.3 Context Injection
When CC needs background information:
```
Manus → CC: "Background: [necessary context]
Proceed with [task] given this context"
```

## 6. Review Patterns

### 6.1 Deliverable Review
```
Manus → CC: "Show me the diff"
CC → Manus: [diff output]
Manus → CC: "Run the tests"
CC → Manus: [test results]
Manus → CC: [approve or request changes]
```

### 6.2 Code Review Request
```
Manus → CC: "Review the code in [file path].
Perform a thorough 2-pass code review:
  - Pass 1: CRITICAL (SQL injection, race conditions, security)
  - Pass 2: INFORMATIONAL (style, test gaps)"
```
