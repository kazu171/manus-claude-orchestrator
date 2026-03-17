# Contributing to Manus Claude Orchestrator

Thanks for your interest in contributing!

## How to Contribute

### Bug Reports & Feature Requests
Open an issue on GitHub with:
- What you expected to happen
- What actually happened
- Steps to reproduce (if applicable)

### Pull Requests
1. Fork the repository
2. Create a feature branch (`feat/your-feature`)
3. Make your changes
4. Ensure `scripts/validate-policy.sh` passes
5. Submit a PR with a clear description

### Policy Improvements
If you've found better approval patterns or escalation rules through real usage:
1. Document the pattern in your PR description
2. Include the number of sessions where the pattern was observed
3. Explain why the current default should change

## Style Guide

- All skill files are in English
- YAML config uses snake_case
- Markdown follows standard formatting
- Shell scripts pass `shellcheck`

## Questions?

Open an issue — we're happy to help.
