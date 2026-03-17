#!/usr/bin/env bash
# validate-policy.sh — policy.yaml validation
#
# Usage: ./validate-policy.sh [policy_path]
#
# Validates that policy.yaml has all required sections and values.
# Returns 0 on success, 1 on validation failure.

set -euo pipefail

POLICY_PATH="${1:-$(dirname "$0")/../assets/policy.yaml}"

if [[ ! -f "$POLICY_PATH" ]]; then
  echo "FAIL: Policy file not found: $POLICY_PATH" >&2
  exit 1
fi

ERRORS=0

# Check required top-level keys
check_key() {
  local key="$1"
  if ! grep -q "^${key}:" "$POLICY_PATH"; then
    echo "FAIL: Missing required section: $key"
    ((ERRORS++))
  else
    echo "OK: $key section present"
  fi
}

# Check optional top-level keys (warn instead of fail)
check_optional_key() {
  local key="$1"
  if ! grep -q "^${key}:" "$POLICY_PATH"; then
    echo "INFO: Optional section not present: $key"
  else
    echo "OK: $key section present"
  fi
}

echo "=== Policy Validation ==="
echo "File: $POLICY_PATH"
echo ""

# Required sections
check_key "version"
check_key "session"
check_key "approval"
check_key "escalation"
check_key "improvement"

# Optional sections
check_optional_key "workflow"

echo ""

# Validate session limits
if grep -q "max_duration_minutes:" "$POLICY_PATH"; then
  DURATION=$(grep "max_duration_minutes:" "$POLICY_PATH" | awk '{print $2}')
  if [[ "$DURATION" -gt 480 ]]; then
    echo "WARN: max_duration_minutes ($DURATION) exceeds 8 hours"
  else
    echo "OK: max_duration_minutes = $DURATION"
  fi
fi

if grep -q "max_cost_usd:" "$POLICY_PATH"; then
  COST=$(grep "max_cost_usd:" "$POLICY_PATH" | awk '{print $2}')
  if [[ "$COST" -gt 200 ]]; then
    echo "WARN: max_cost_usd ($COST) exceeds $200"
  else
    echo "OK: max_cost_usd = $COST"
  fi
fi

# Validate approval lists exist
for list in always_allow ask_once always_deny; do
  if grep -q "$list:" "$POLICY_PATH"; then
    COUNT=$(grep -A 50 "$list:" "$POLICY_PATH" | grep -c "^    -" || true)
    echo "OK: approval.$list has $COUNT items"
  else
    echo "FAIL: Missing approval.$list"
    ((ERRORS++))
  fi
done

# Validate critical always_deny items
for deny_item in git_force_push production_deploy; do
  if grep -q "$deny_item" "$POLICY_PATH"; then
    echo "OK: $deny_item in always_deny"
  else
    echo "WARN: $deny_item not found in always_deny — consider adding"
  fi
done

echo ""
echo "=== Result ==="
if [[ "$ERRORS" -gt 0 ]]; then
  echo "FAILED: $ERRORS errors found"
  exit 1
else
  echo "PASSED: All checks passed"
  exit 0
fi
