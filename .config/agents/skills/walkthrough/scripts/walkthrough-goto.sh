#!/usr/bin/env bash
# Walkthrough skill: open a file, center a line, and highlight a range in the
# user's running Neovim, all in one round-trip.
#
# Usage: walkthrough-goto.sh <abs-file> <start-line> [end-line]
#   start/end are 1-based inclusive. The gutter numbers the user sees. end
#   defaults to start (single-line highlight).
#
# Exit codes: 0 = navigated, 1 = bad args / file missing / editor refused.
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

ok() { printf "${GREEN}[goto]${NC} %s\n" "$1"; }
fail() { printf "${RED}[error]${NC} %s\n" "$1" >&2; }

if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
  fail "usage: walkthrough-goto.sh <abs-file> <start-line> [end-line]"
  exit 1
fi

file="$1"
start="$2"
end="${3:-$2}"

# Highlighting is line-based, so a non-absolute path would resolve against
# Neovim's cwd, not ours. Require an absolute path up front.
case "$file" in
/*) ;;
*)
  fail "path must be absolute: $file"
  exit 1
  ;;
esac

if [ ! -f "$file" ]; then
  fail "file not found: $file"
  exit 1
fi

if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
  fail "line numbers must be positive integers: start=$start end=$end"
  exit 1
fi

# Be forgiving if the caller passes the range backwards.
if [ "$start" -gt "$end" ]; then
  tmp="$start"
  start="$end"
  end="$tmp"
fi

# The path is embedded in a single-quoted Lua string literal below. Insert a
# single backslash before each single quote (Lua honours backslash escapes) so a
# name like `it's.rb` cannot terminate the literal early. sed is used
# deliberately: bash parameter-expansion escaping doubles the backslash here,
# producing `\\'` (escaped backslash + terminator) instead of `\'`.
lua_file="$(printf '%s' "$file" | sed "s/'/\\\\'/g")"

# The whole hop runs inside one :lua block so it is a single RPC call and a
# single JSON parse, no matter how many lines the range spans. The Lua is
# intentionally one line as Ex commands are line-oriented.
#
# `:edit` (not `edit!`) is used: with 'hidden' on (the user's config) it
# switches buffers without losing unsaved work, and the modified buffer stays
# loaded in the background. The pcall guards a genuine edit failure (e.g. the
# file became unreadable between our check and the switch); on failure the Lua
# re-raises with a WT_EDIT_FAILED marker. nvim-control turns a raised error into
# {"ok":false,...} whose payload does NOT echo the command, so the marker can be
# detected without colliding with the command string a success response echoes
# back. Clearing happens AFTER the edit so it targets the destination buffer
# (correct for multi-file tours). Lines are clamped to the buffer so a stale
# citation lands safely. Highlighting uses nvim_buf_set_extmark with
# line_hl_group — nvim_buf_add_highlight is deprecated on the user's nvim 0.12.
lua="$(
  cat <<LUA
_G.WT_NS = _G.WT_NS or vim.api.nvim_create_namespace('walkthrough') local ok_edit, err = pcall(vim.cmd.edit, vim.fn.fnameescape('${lua_file}')) if not ok_edit then error('WT_EDIT_FAILED: ' .. tostring(err)) end vim.api.nvim_buf_clear_namespace(0, _G.WT_NS, 0, -1) local last = vim.api.nvim_buf_line_count(0) local s = math.max(1, math.min(${start}, last)) local e = math.max(1, math.min(${end}, last)) vim.api.nvim_win_set_cursor(0, { s, 0 }) vim.cmd('normal! zz') for l = s - 1, e - 1 do vim.api.nvim_buf_set_extmark(0, _G.WT_NS, l, 0, { line_hl_group = 'Visual' }) end
LUA
)"

response="$(nvim-control ex "lua ${lua}" 2>&1)" || {
  fail "nvim-control invocation failed: ${response}"
  exit 1
}

# A success response carries "ok":true (and echoes the command, which itself
# contains the WT_EDIT_FAILED literal — so that marker can only be trusted once
# we know the call FAILED). A control failure carries "ok":false; a connection
# failure carries the "error" JSON key. Match the quoted keys so a success
# payload cannot trigger a false positive.
if printf '%s' "$response" | grep -q '"ok":false' ||
  printf '%s' "$response" | grep -q '"error":'; then
  # Within a genuine failure, the re-raised marker means the buffer switch
  # itself failed (e.g. the file became unreadable), not a connection drop.
  if printf '%s' "$response" | grep -q 'WT_EDIT_FAILED'; then
    fail "could not open ${file} in Neovim. Raw response: ${response}"
  else
    fail "no Neovim session for $PWD — start one here with \`v\`, or set"
    fail "NVIM_CONTROL_SOCKET. Raw response: ${response}"
  fi
  exit 1
fi

ok "${file}:${start}-${end}"
printf '%s\n' "$response"
