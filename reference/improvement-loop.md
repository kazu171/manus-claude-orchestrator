# Improvement Loop — Self-Improvement Mechanism

Pattern-based post-session retrospective and continuous improvement framework.

## 1. SESSION_RETRO (After Every Session)

### 1.1 Retrospective Prompt
At session end, Manus sends to CC:
```
Perform a session retrospective. Analyze the following:

1. **Achievements**: What was accomplished
2. **Blockers**: What took time, what got stuck
3. **Approval patterns**: Which approvals occurred frequently
4. **Improvement proposals**: Specific change suggestions for policy.yaml or templates

Output format: Markdown, save to `.manus/retros/YYYY-MM-DD-HH.md`
```

### 1.2 Retro Output Template
```markdown
# Session Retro — {date}

## Summary
- Duration: {minutes} min
- Tasks completed: {count}
- Errors encountered: {count}

## What Worked
- {item}

## What Didn't Work
- {item}

## Approval Patterns
| Action | Count | Current Policy | Suggestion |
|--------|-------|---------------|------------|
| {action} | {n} | {policy} | {suggestion} |

## Policy Adjustment Proposals
- [ ] {proposal}

## Template Improvements
- [ ] {improvement}

## Manus Instructions Improvements
- [ ] {improvement}
```

### 1.3 Retro → Policy Update Flow
```
Retro Analysis
  │
  ├─ Approval pattern change proposed
  │   → Propose update to policy.yaml approval section
  │   → Apply after human confirmation
  │
  ├─ Template improvement identified
  │   → Propose update to relevant assets/task-templates/ file
  │
  └─ Manus instructions improvement identified
      → Propose update to assets/manus-instructions.md
```

## 2. PATTERN_LEARNING (Periodic)

### 2.1 Approval Pattern Statistics
Analyze retros from multiple sessions to extract patterns:

```
# Analysis targets
.manus/retros/*.md

# Extracted items
- Most frequently approved operations → always_allow candidates
- Most frequently denied operations → always_deny candidates
- ask_once items with consistent decisions → promote to always_allow/deny
```

### 2.2 Template Optimization
```
# Template usage frequency
- Frequently used templates → refine and add detail
- Unused templates → consider removal
- Intents not covered by existing templates → create new template
```

### 2.3 Graduation Criteria
Improvement proposals are formally adopted when:
- Same proposal appears `pattern_graduation_threshold` (default: 3) or more times
- Confirmed by human
- No side effects (no conflicts with other policies)

## 3. EXTERNAL_UPDATE

### 3.1 Manus Desktop Update Tracking
Keep up with Manus Desktop new features and bug fixes:
```
1. Check Manus official release notes
2. Evaluate if new features affect orchestration
3. If affected:
   - Update manus-instructions.md
   - Update safety-guards.md (if needed)
   - Update policy.yaml (if needed)
```

### 3.2 Claude Code Update Tracking
Keep up with CC new features and bug fixes:
```
1. Check CC release notes
2. Evaluate if new features affect orchestration
3. If affected:
   - Update SKILL.md Intent Dispatch Table
   - Update dialogue-protocol.md interaction patterns
   - Update workflow-integration.md coordination patterns
```

### 3.3 Community Knowledge Integration
Community knowledge integration flow:
```
1. Collect external insights (articles, podcasts, discussions)
2. Extract insights relevant to manus-orchestrator
3. Reflect in reference/ or add new reference
4. Update SKILL.md (if needed)
```

## 4. GRADUATION

### 4.1 Improvement Promotion Path
```
Discovered in Session Retro
  ↓
Recorded in retro file
  ↓
Same improvement proposed 3+ times
  ↓
Human confirms
  ↓
Formally adopted:
  ├─ Policy change → update policy.yaml
  ├─ Pattern addition → update reference/
  ├─ Template improvement → update assets/task-templates/
  └─ Instructions improvement → update manus-instructions.md
```

### 4.2 Demotion / Removal
When an improvement proves counterproductive:
```
1. Reported as issue in retro
2. Human confirms
3. Revert or modify the change
```
