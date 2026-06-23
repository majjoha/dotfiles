---
name: nvim-control
description: >
  Run explicit Neovim control actions through `nvim-control` subcommands. Use
  when users ask to change editor state, run `Ex` commands, open splits, save
  buffers, or trigger diffs.
---

# Neovim control provider
## Purpose
Provides explicit mutation and command execution for the user's running Neovim
session.

## Invocation
`nvim-control` is an executable already on `PATH`, not a script bundled with
this skill. Invoke it directly by its bare name, for example `nvim-control
read`. Never prefix it with the skill directory or any other path; a path inside
the skill directory does not exist and will fail.

## How it works
1. Read context first with `nvim-control read` when the action depends on the
   current file, cursor, selection, or diagnostics.
2. Execute a control subcommand through `nvim-control ex "..."` or `nvim-control
   keys "..."`.
3. Parse the returned JSON and confirm the `context_after` snapshot matches the
   intended change.

## Usage examples
- "Save this buffer" → `nvim-control ex "write"`
- "Open a vertical split" → `nvim-control ex "vsplit"`
- "Open a diff against another file" → `nvim-control ex "diffsplit other.rb"`
- "Open the quickfix list" → `nvim-control ex "copen"`

## Implementation
Prefer `ex` over `keys` when both can express the same action. Use `keys` only
for workflows that genuinely require raw input. Before mutating the editor,
briefly state the intended action.
