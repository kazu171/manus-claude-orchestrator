# Quick Start — 5 Minutes to Your First Manus × Claude Code Session

## Step 1: Get Manus Desktop

If you don't have Manus yet, [get access here](https://manus.im/invitation/LM102IK4RRBDDY).

## Step 2: Install the Skill

```bash
npx skills add kazu171/manus-claude-orchestrator
```

Or clone manually:
```bash
git clone https://github.com/kazu171/manus-claude-orchestrator.git ~/.agents/skills/manus-orchestrator
```

## Step 3: Configure Manus

1. Open Manus Desktop
2. Go to Settings → Instructions
3. Copy the entire contents of `assets/manus-instructions.md`
4. Paste it into the Instructions field
5. Save

## Step 4: Start a Session

Tell Manus something like:

> "Open a terminal, navigate to ~/projects/my-app, and run `claude --dangerously-skip-permissions`. Then check the CLAUDE.md and start planning the next feature."

Manus will:
1. Open your terminal
2. Launch Claude Code in bypass mode
3. Enter Plan Mode
4. Review and approve Claude's plan
5. Drive the implementation session

## Step 5: Customize Your Policy

Edit `assets/policy.yaml` to match your preferences:

```yaml
session:
  max_duration_minutes: 60   # Shorter sessions
  max_cost_usd: 25           # Lower budget

approval:
  always_allow:
    - file_read
    - file_write
    - test_run
    # Add more as you gain confidence
```

## What Happens During a Session

```
You → Manus: "Build a login page"
Manus → Claude Code: "Check CLAUDE.md, enter Plan Mode"
Claude Code → Manus: [Plan for login page]
Manus: [Reviews plan, approves]
Claude Code: [Implements login page]
Manus: [Reviews diff, runs tests, approves or requests changes]
Manus → You: "Login page complete. Tests passing. Ready for review."
```

## Tips

- **Start small**: Try a bug fix or small feature first
- **Watch the session**: Manus's decisions are visible in the terminal
- **Evolve your policy**: After each session, check `.manus/retros/` for improvement suggestions
- **Use Plan Mode**: It's required by default — this prevents Manus from jumping into code without thinking

## Next Steps

- Read [advanced-session.md](advanced-session.md) for a full session walkthrough
- Customize `assets/policy.yaml` for your team's workflow
- Add custom task templates in `assets/task-templates/`
