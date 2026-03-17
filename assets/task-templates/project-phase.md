# Task: Project Phase — [PHASE_NAME]

## Goal
Execute [PHASE_NAME] of the project plan.

## Context
- Project: [PROJECT_NAME]
- Branch: `feat/[PHASE_SLUG]`
- Phase: [PHASE_NUMBER] of [TOTAL_PHASES]
- Dependencies: [Previous phase deliverables]

## Pre-flight Checks
- [ ] Previous phase deliverables are verified
- [ ] Branch is up to date with main
- [ ] All existing tests pass
- [ ] CLAUDE.md and project notes are current

## Execution Steps
1. Review the phase plan and acceptance criteria
2. Enter Plan Mode with the implementation approach
3. After plan approval, implement step by step
4. Run tests after each major change
5. Commit in bisectable increments

## Manus Judgment Criteria
- **Approve**: Implementation matches the plan, tests pass, no scope creep
- **Request changes**: Deviation from plan, failing tests, missing edge cases
- **Escalate**: Security concerns, architecture changes not in plan, cost overrun

## Completion Verification
- [ ] All acceptance criteria met
- [ ] All tests pass (new + existing)
- [ ] Code reviewed
- [ ] Changes committed with descriptive messages
- [ ] Phase deliverables documented

## Notes
[Additional context, constraints, or phase-specific instructions]
