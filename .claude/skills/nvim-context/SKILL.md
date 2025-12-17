---
name: nvim-context
description: Get the current Neovim context as JSON (cursor position, current
file, visual selection and diagnostics) to help answer questions about code at
the current cursor position, visual selections and diagnostics. Use when users
ask about "this line", "current file", "selection" or need context about their
Neovim editor state.
---

# Neovim context provider
## Purpose
Provides live context from the user's Neovim editor session to help answer
context-aware questions about code.

## How it works
1. Executes the `nvim-context` tool to get the current editor state.
2. Returns JSON data including cursor position, open file, visual selection and
   diagnostics.
3. Use this information to understand references like "this line", "the
   selection", "current file", etc.

## Usage examples
- "What's wrong with this line?" → Check diagnostics at cursor
- "Explain the selected code" → Analyze visual selection
- "What file am I in?" → Return current file path
- "Show me all errors" → List all LSP diagnostics

## Technical Details
The skill runs: `nvim-context`

This provides JSON output like:
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
