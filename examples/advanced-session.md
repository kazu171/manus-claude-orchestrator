# Advanced Session Walkthrough

A complete example of a Manus × Claude Code session building a feature from scratch.

## Scenario

You want Manus to build a REST API endpoint for user profile updates in a Next.js + Supabase project.

## Phase 1: SESSION_START

You tell Manus:
> "Open terminal, go to ~/projects/my-saas-app, launch claude --dangerously-skip-permissions. The goal is to add a PATCH /api/users/[id] endpoint."

Manus opens your terminal and types:
```
cd ~/projects/my-saas-app && claude --dangerously-skip-permissions
```

Then Manus sends to Claude Code:
```
Check this project's CLAUDE.md and show me the current state.
We'll proceed in Plan Mode.
```

## Phase 2: PLAN_MODE

Claude Code enters Plan Mode and presents a plan:
- Read existing API routes for patterns
- Create `app/api/users/[id]/route.ts`
- Add Supabase RLS policy
- Write integration tests
- Update API docs

Manus reads the plan, verifies it covers all requirements, and approves.

## Phase 3: TASK_DELEGATION

Manus injects the new-feature template with filled values:
```
# Task: New Feature — User Profile Update API

## Goal
Implement PATCH /api/users/[id] endpoint.

## Requirements
1. Accept partial updates (name, email, avatar_url)
2. Validate input with Zod
3. RLS policy: users can only update their own profile
...
```

## Phase 4: INTERACTIVE_EXECUTION

Claude Code works through the implementation. During execution:

- CC asks to install `zod` → Manus checks policy (ask_once: package_install) → approves
- CC asks about error response format → Manus answers based on existing API patterns
- CC creates the route file → auto-approved (always_allow: file_create)
- CC runs tests → auto-approved (always_allow: test_run)

## Phase 5: REVIEW_AND_ITERATE

Manus requests:
```
Show me the diff
```

Reviews the changes, then:
```
Run the tests
```

All tests pass. Manus approves and moves to session end.

## Phase 6: SESSION_END

Manus:
```
Commit any uncommitted changes with a descriptive message.
Then do a session retrospective.
```

Claude Code commits and produces a retro saved to `.manus/retros/`.

## Key Observations

1. **Plan Mode prevented scope creep** — Claude wanted to also refactor the GET endpoint, but the plan kept scope focused
2. **Policy prevented mistakes** — `always_deny: main_branch_direct_push` kept work on the feature branch
3. **Retro improved future sessions** — The retro noted that `zod` installs should be `always_allow` since it's a project dependency
