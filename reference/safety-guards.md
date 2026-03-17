# Safety Guards — Safety Architecture

## 1. Manus-Side Configuration

### 1.1 Instructions Setup
Set the contents of `assets/manus-instructions.md` in Manus Desktop's Instructions.
This enables Manus to make judgments based on policy.yaml.

### 1.2 Always Allow Policies
Configure the following as Always Allow in Manus Desktop settings:
- Terminal command execution (for launching claude commands)
- File reading (for session log review)

### 1.3 Manus-Side Constraints
Manus must **never**:
- Edit code directly outside of CC
- Perform git operations without going through CC
- Launch multiple CC sessions simultaneously (to prevent conflicts)

## 2. Claude Code-Side Configuration

### 2.1 Launch Options
```bash
claude --allowedTools "Read,Write,Edit,Bash,Grep,Glob,Agent,Skill"
```

Recommended: Explicitly specify allowed tools with `--allowedTools`.
When invoked via Manus, approval dialogs are automatically shown to Manus.

### 2.2 CC's Built-in Guards
CC has the following built-in safeguards:
- Destructive operation confirmation dialogs (Manus responds)
- Plan Mode (Manus reviews and approves)
- AskUserQuestion (Manus answers)

## 3. Git Protection Rules

### 3.1 Absolutely Prohibited
| Operation | Reason |
|-----------|--------|
| `git push --force` | Risk of history destruction |
| Direct push to `main`/`master` | Review bypass |
| `git reset --hard` (on pushed commits) | Shared history destruction |
| `--no-verify` flag | Hook bypass |

### 3.2 Feature Branch Rules
- All work is done on feature branches
- Branch naming: `feat/`, `fix/`, `refactor/`, `chore/` prefixes
- Merge to main via PR only

### 3.3 Commit Rules
- Each commit must be bisectable (independently testable)
- Commit messages follow Conventional Commits format
- No empty commits

## 4. Cost / Time Limits

### 4.1 Session Limits
Controlled by the `session` section of `policy.yaml`:
- `max_duration_minutes`: Maximum session duration (default: 120 min)
- `max_cost_usd`: Maximum session cost (default: $50)
- `context_budget_percent`: Context usage limit (default: 60%)

### 4.2 Behavior on Limit Reached
1. **Time limit**: Manus initiates session end
2. **Cost limit**: Manus immediately ends session
3. **Context limit**: Instruct `/compact`, end session if no improvement

### 4.3 Monitoring
Manus periodically checks:
- CC response time (intervene if abnormally slow)
- Error frequency (consecutive error count)
- Progress state (stall detection)

## 5. Escalation Design

### 5.1 Escalation Decision Flow
```
CC request/situation
  │
  ├─ Matches policy.yaml always_allow? → Auto-approve
  ├─ Matches policy.yaml always_deny? → Auto-deny
  ├─ Matches policy.yaml ask_once? → First-time check, then approve
  ├─ Matches escalation.triggers? → STOP + notify human
  └─ Matches none? → Manus uses contextual judgment
       ├─ Low risk → approve
       └─ Unknown risk → STOP + notify human
```

### 5.2 STOP Notification Format
```
[ESCALATION] Session paused
━━━━━━━━━━━━━━━━━━━━━━
Trigger: {trigger_type}
Reason: {detailed_reason}
Current task: {current_task}
CC state: {cc_state}
━━━━━━━━━━━━━━━━━━━━━━
Options:
A) {option_a}
B) {option_b}
C) End session
```

## 6. Data Protection

### 6.1 Secrets Management
- `.env`, `credentials.json`, etc. are excluded from CC commits
- Manus does not pass secrets to CC
- API keys via environment variables only

### 6.2 Log Handling
- Session logs record executed commands and results
- Secret values are masked in logs
- Log storage: `policy.yaml` `session.log_directory`
