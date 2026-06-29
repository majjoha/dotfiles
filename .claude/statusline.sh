#!/bin/sh

set -e

# Status line: model · context used % · plan usage remaining %
#
# "Usage remaining" reflects the Claude.ai subscription rate-limit window
# (5-hour bucket preferred, 7-day fallback). It is only present for subscribers
# after the first API response. API-key users will see no usage-remaining field:
# omitted rather than faked.

# ANSI dim (SGR 2) matches the "… +N lines" truncation colour.
readonly DIM="\033[2m"
readonly RESET="\033[0m"

input=$(cat)
model=$(printf "%s" "$input" | jq -r '.model.display_name // empty')
ctx_used=$(printf "%s" "$input" |
  jq -r '.context_window.used_percentage // empty')

# Prefer 5-hour window; fall back to 7-day; absent for API-key users.
rate_used=$(printf "%s" "$input" |
  jq -r '.rate_limits.five_hour.used_percentage //
          .rate_limits.seven_day.used_percentage //
          empty')

parts=""
if [ -n "$model" ]; then
  parts="$model"
fi
if [ -n "$ctx_used" ]; then
  parts="$parts · Context: $(printf "%.0f" "$ctx_used")% used"
fi
if [ -n "$rate_used" ]; then
  rate_remaining=$(printf "%s" "$rate_used" | awk '{printf "%.0f", 100 - $1}')
  parts="$parts · Plan: ${rate_remaining}% left"
fi

if [ -z "$parts" ]; then
  exit 0
fi

printf "%b%s%b" "$DIM" "$parts" "$RESET"
