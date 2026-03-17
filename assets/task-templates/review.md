# Task: Code Review — [REVIEW_TARGET]

## Target
[Review target — PR number, branch name, file path, etc.]

## Review Type
- [ ] PR review (thorough 2-pass review)
- [ ] Security review
- [ ] Performance review
- [ ] Architecture review

## Context
- Project: [PROJECT_NAME]
- Author: [Change author]
- Related: [Issue/PR link]

## Focus Areas
1. [Focus point 1]
2. [Focus point 2]
3. [Focus point 3]

## Approach
Follow these steps:
1. Get the change diff
2. Perform a thorough 2-pass code review:
   - Pass 1: CRITICAL (SQL injection, race conditions, LLM issues, enums)
   - Pass 2: INFORMATIONAL (style, test gaps)
3. Report review results as summary
4. If CRITICAL findings, provide specific fix suggestions

## Output Format
```
## Review Summary
- CRITICAL: {count} items
- INFORMATIONAL: {count} items

### CRITICAL
1. [file:line] [issue description] [fix suggestion]

### INFORMATIONAL
1. [file:line] [issue description]
```
