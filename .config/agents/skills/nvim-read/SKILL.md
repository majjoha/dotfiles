---
name: nvim-read
description: >
  Get the current Neovim context as JSON (cursor position, current file, visual
  selection and diagnostics) to help answer questions about code at the current
  cursor position, visual selections and diagnostics. Use when users ask about
  "this line", "current file", "selection" or need context about their Neovim
  editor state.
---

# Neovim context reader
## Purpose
Provides live context from the user's Neovim editor session to help answer
context-aware questions about code.

## Invocation
`nvim-control` is an executable already on `PATH`, not a script bundled with
this skill. Invoke it directly by its bare name, for example `nvim-control
read`. Never prefix it with the skill directory or any other path; a path inside
the skill directory does not exist and will fail.

## How it works
1. Executes `nvim-control read` to get the current editor state.
2. Returns JSON data including cursor position, open file, visual selection and
   diagnostics.
3. Use this information to understand references like "this line", "the
   selection", "current file", etc.

## Usage examples
- "What's wrong with this line?" → Check diagnostics at cursor
- "Explain the selected code" → Analyze visual selection
- "What file am I in?" → Return current file path
- "Show me all errors" → List all LSP diagnostics

## Technical details
To use this skill, execute `nvim-control read` which outputs JSON:
```json
{
  "cursor": {
    "line": 43,
    "col": 3
  },
  "file": "/path/to/current/file.rb",
  "selection": null,
  "diagnostics": []
}
```

## Implementation
When this skill is loaded, execute `nvim-control read` via Bash and parse the
JSON output to understand the current editor state. Use the returned data to
answer user questions about their code. Do not mutate editor state through this
skill. Use `nvim-control` for explicit editor actions.
