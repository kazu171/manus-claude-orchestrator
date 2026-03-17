#!/usr/bin/env bash
# start-session.sh — Manus → Claude Code session launcher
#
# Usage: ./start-session.sh [project_dir] [--tools TOOLS] [--model MODEL]
#
# Examples:
#   ./start-session.sh ~/projects/my-app
#   ./start-session.sh ~/projects/my-app --tools "Read,Write,Edit,Bash,Grep,Glob,Agent,Skill"
#   ./start-session.sh ~/projects/my-app --model opus

set -euo pipefail

# Defaults
PROJECT_DIR="${1:-.}"
ALLOWED_TOOLS="Read,Write,Edit,Bash,Grep,Glob,Agent,Skill"
MODEL=""

# Parse optional flags
shift || true
while [[ $# -gt 0 ]]; do
  case "$1" in
    --tools)
      ALLOWED_TOOLS="$2"
      shift 2
      ;;
    --model)
      MODEL="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

# Validate project directory
if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "Error: Project directory not found: $PROJECT_DIR" >&2
  exit 1
fi

# Resolve absolute path
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"

# Build claude command
CMD="claude"
CMD+=" --allowedTools \"$ALLOWED_TOOLS\""

if [[ -n "$MODEL" ]]; then
  CMD+=" --model $MODEL"
fi

# Log session start
LOG_DIR="${PROJECT_DIR}/.manus/session-logs"
mkdir -p "$LOG_DIR"
SESSION_ID="$(date +%Y%m%d-%H%M%S)"
LOG_FILE="${LOG_DIR}/session-${SESSION_ID}.log"

echo "=== Manus Orchestrator Session ===" | tee "$LOG_FILE"
echo "Session ID: $SESSION_ID" | tee -a "$LOG_FILE"
echo "Project: $PROJECT_DIR" | tee -a "$LOG_FILE"
echo "Started: $(date -u +%Y-%m-%dT%H:%M:%SZ)" | tee -a "$LOG_FILE"
echo "Tools: $ALLOWED_TOOLS" | tee -a "$LOG_FILE"
echo "===================================" | tee -a "$LOG_FILE"

# Change to project directory and start claude
cd "$PROJECT_DIR"
echo "Starting Claude Code in: $PROJECT_DIR"
eval "$CMD"
