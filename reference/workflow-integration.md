# Workflow Integration — Project Workflow and Coordination

## 1. Project Workflow Patterns

### 1.1 Phased Project Execution
For multi-phase projects, Manus drives execution through structured phases:

```
Manus → CC: "Check the project status and current phase"
CC → Manus: [Current phase/state displayed]
  │
  ├─ Unplanned phase exists
  │   Manus → CC: "Create a plan for the next phase"
  │   CC → Manus: [Plan Mode with phase plan]
  │   Manus: [Review plan → approve/modify]
  │
  ├─ Planned phase ready
  │   Manus → CC: "Execute the current phase plan"
  │   CC: [Phase execution begins]
  │   Manus: [Provide approvals and answers during execution]
  │
  └─ All phases complete
      Manus → CC: "Verify milestone completion status"
      [Escalate to human: milestone completion decision]
```

### 1.2 Manus's Role During Execution
- **Approver**: Approve CC's tool requests based on policy
- **Responder**: Answer CC's AskUserQuestion prompts
- **Reviewer**: Review and approve Plan Mode plans
- **Monitor**: Detect progress stalls or consecutive errors

## 2. Task Queue Patterns

### 2.1 Asynchronous Task Management
For tasks that don't need interactive oversight:
```
Manus → CC: "Add [task description] to the task backlog"
CC: [Task recorded]
```

### 2.2 Task Prioritization
```
Manus → CC: "Show me the current task backlog"
CC → Manus: [Backlog status + completed tasks]
```

### 2.3 Interactive vs Async Decision

| Scenario | Recommended | Reason |
|----------|------------|--------|
| Decisions needed | Interactive session | Manus provides approvals and answers |
| Routine tasks | Async/batch | No judgment needed |
| Test-only runs | Async/batch | No decisions required |
| Refactoring | Interactive session | Direction confirmation needed |
| New features | Interactive session | Interactive requirement clarification |

## 3. Execution Modes

### 3.1 Direct Interactive Mode
```
Manus (CEO/COO)
  │
  └─ Direct interaction: Manus and CC work 1:1
     Manus provides decisions, CC executes
```

### 3.2 Autonomous Monitoring Mode
```
Manus (CEO/COO)
  │
  └─ Monitoring mode: CC executes autonomously, Manus observes
     CC: [Autonomous execution]
     Manus: [Monitor progress, intervene only when needed]
```

### 3.3 When to Intervene in Autonomous Mode
1. **Normally**: Watch CC's autonomous execution without intervening
2. **Intervene when**:
   - CC escalates
   - Direction diverges from goals
   - Consecutive errors
   - Approaching cost/time limits
3. **How to intervene**: Pause autonomous execution, switch to interactive mode

### 3.4 Mode Switching
```
# Autonomous → Interactive
Manus → CC: "Pause autonomous execution. Let's discuss [topic] interactively"

# Interactive → Autonomous
Manus → CC: "Continue the remaining phases autonomously"
```

## 4. Agent Teams Coordination

### 4.1 Manus's Position
Agent Teams is CC's internal parallel execution mechanism.
Manus reviews Teams results.

```
Manus → CC: "[task] — use Agent Teams for parallel execution if appropriate"
CC: [Teams launched → parallel execution]
CC → Manus: [Results summary]
Manus: [Review → approve/request changes]
```

### 4.2 When to Use Teams
Manus instructs Teams usage for:
- Multiple independent file/feature implementations
- Research + implementation in parallel
- Test + main code simultaneous creation

Manus avoids Teams for:
- Tasks with dependencies
- Small single tasks
- When near cost limits

## 5. External Tool Integration

### 5.1 GitHub Issues
```
Manus → CC: "Check GitHub issues for the current milestone"
CC: [Fetches and displays issues]
Manus: [Selects issue to work on → creates task from issue]
```

### 5.2 Generic Integration Pattern
```
1. Manus identifies work items from external system
2. Manus translates into task template
3. CC executes via standard workflow
4. Manus verifies results against external system requirements
```
