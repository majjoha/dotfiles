#!/usr/bin/env bash
# Block rm commands; require `trash` instead.

set -euo pipefail

command=$(jq -r '.tool_input.command // empty')

if [[ -z "$command" ]]; then
  exit 0
fi

if printf '%s' "$command" | grep -qE '(^|[;&|`(])[[:space:]]*rm([[:space:]]|$)'; then
  cat >&2 <<'EOF'
Blocked: use `trash` instead of `rm`.
  - Delete files:  trash file1 file2
  - Delete dir:    trash -s directory
EOF
  exit 2
fi

exit 0
