#!/usr/bin/env bash
# session-log.sh — Session log helper
#
# Usage: ./session-log.sh [project_dir] [--summary "text"]
#
# Appends session end info to the most recent session log.
# If --summary is provided, adds it to the log.

set -euo pipefail

PROJECT_DIR="${1:-.}"
SUMMARY=""

# Parse optional flags
shift || true
while [[ $# -gt 0 ]]; do
  case "$1" in
    --summary)
      SUMMARY="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

# Resolve absolute path
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
LOG_DIR="${PROJECT_DIR}/.manus/session-logs"

if [[ ! -d "$LOG_DIR" ]]; then
  echo "Error: No session logs found in $LOG_DIR" >&2
  exit 1
fi

# Find most recent log
LATEST_LOG="$(ls -t "$LOG_DIR"/session-*.log 2>/dev/null | head -1)"

if [[ -z "$LATEST_LOG" ]]; then
  echo "Error: No session log files found" >&2
  exit 1
fi

# Append session end info
{
  echo ""
  echo "=== Session End ==="
  echo "Ended: $(date -u +%Y-%m-%dT%H:%M:%SZ)"

  if [[ -n "$SUMMARY" ]]; then
    echo ""
    echo "Summary:"
    echo "$SUMMARY"
  fi

  # Git status snapshot
  if git -C "$PROJECT_DIR" rev-parse --is-inside-work-tree &>/dev/null; then
    echo ""
    echo "Git Status:"
    git -C "$PROJECT_DIR" log --oneline -5 2>/dev/null | sed 's/^/  /'
    echo ""
    DIRTY="$(git -C "$PROJECT_DIR" status --porcelain 2>/dev/null | wc -l | tr -d ' ')"
    echo "  Uncommitted changes: $DIRTY files"
  fi

  echo "==================="
} >> "$LATEST_LOG"

echo "Session log updated: $LATEST_LOG"
