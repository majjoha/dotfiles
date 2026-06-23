---
name: walkthrough
description: >
  Drive the user's Neovim editor to follow along as you explain code. Opens each
  referenced file, jumps to the line, centers it, and highlights the relevant
  range so the cursor tracks the narration. Use ONLY when the user explicitly
  asks to be walked through code ("walk me through this", "guided tour",
  "/walkthrough"). It moves their cursor, so do not invoke it for ordinary
  explanations.
disable-model-invocation: true
argument-hint: "[topic or file to tour]"
allowed-tools:
  - Bash(nvim-control *)
  - Bash(*/walkthrough-goto.sh *)
  - Read
  - AskUserQuestion
---

# Code walkthrough
Synchronize a spoken explanation of code with the user's Neovim view. As you
narrate, the editor opens each file, jumps to the line, centers it, and
highlights the relevant range, so the user sees exactly what you are describing
instead of holding a list of `file:line` references in their head.

This is a user-paced, interactive tour. You present one stop, then hand control
back with a structured question (see "Asking the user a question" below) so the
user can pick where to go next by selecting an option (or typing a follow-up).
Only then do you move. Never play the whole tour through on your own moving from
stop to stop without being asked defeats the point.

## Asking the user a question
This skill runs under more than one agent, and each exposes a different
structured-question tool. Wherever a step says to hand control back or offer a
choice:
- Under Claude Code, use `AskUserQuestion`. It appends the free-form "Other"
  option itself, so do not add your own.
- Under Codex, use `request_user_input` **only if it is listed in the available
  tools for this turn** (its availability depends on the collaboration mode and
  a feature flag, so it is not always present). It also appends a free-form
  option for you.
- Otherwise, present the stop and ask in concise plain text where to go next
  ("next / previous / done, or name a place to jump to"), then wait for the
  reply before moving. The interactive, one-stop-at-a-time discipline is the
  same regardless of which mechanism is used.

## Resolving the helper script
The `goto` helper lives in this skill's own `scripts/` directory. Claude Code
exposes that directory as `$CLAUDE_SKILL_DIR`; under other agents, resolve the
path against this skill file's own directory, which the agent already knows.
Always invoke it by an absolute path.

## Step 1: Preflight the editor connection
Probe the running session before moving anything:
```sh
nvim-control read
```
The `read` action exits 0 even on failure, so branch on the JSON, not the exit
code. If the output contains an `"error"` key (e.g. `{"error":"Connection
failed",...}`), STOP and tell the user: "I can't reach a Neovim session in this
directory. Start one here with `v`, or set `NVIM_CONTROL_SOCKET` to the right
socket, then ask again." Otherwise capture the returned `file` and `cursor`,
that is where the user started, in case they want to return there at the end.

## Step 2: Plan the tour and announce it
Decide the ordered stops BEFORE moving the cursor. Each stop is `(absolute file,
start line, end line, one to three sentences of narration)`. `Read` the files
first so the ranges are accurate and the prose is correct. A tour is a curated
path, not every reference you could cite, include only the stops that carry the
explanation.

Then tell the user the shape of the tour up front: how many stops there are and
a one-line outline, so they know what to expect before you move their cursor.
Then present the first stop (Step 3).

## Step 3: Present ONE stop, then ask where to go next
The tour is user-paced, not a slideshow you play through. Show exactly one stop,
then ask the user where to go via the structured question for the current agent
(see "Asking the user a question"). For the current stop, in this exact order:
1. **Narrate first, then move.** Say the one-to-three-sentence explanation of
   what the user is about to see and why it matters. This frames intent before
   their eyes jump; the cursor then lands as the punctuation that confirms what
   you meant.
2. Drive the editor to this stop with a single call to the helper script (see
   "Resolving the helper script"; omit the third argument to highlight one
   line):
   ```sh
   "<skill-dir>/scripts/walkthrough-goto.sh" /abs/path 42 55
   ```
3. Parse the JSON. Confirm `context_after.file` is the intended file and
   `context_after.cursor.line` is at or inside the range. If the script exited
   non-zero, surface its one-line hint and fix it (e.g., a corrected path, or
   restarting the editor when the session is unreachable).
4. **Hand control back with a structured question.** Do NOT advance on your
   own, firing the next `goto` unasked is the failure this skill exists to
   avoid. Ask one question (header like "Stop 2 of 5", the question being a
   one-line recap of where they are) with these options, including only the ones
   that apply at this stop:
   - **Next** — "Continue to stop 3" (omit on the last stop).
   - **Previous** — "Back to stop 1" (omit on the first stop).
   - **Done** — "End the tour and clear highlights".
   The user can always supply a free-form answer to type a follow-up question or
   a jump like "go to the error handler". The structured-question tools append
   that option for you; in the plain-text fallback, invite it explicitly.

Act on the selection, then present the next single stop the same way:
- **Next**: advance to the next stop.
- **Previous**: re-present the prior stop (drive the editor back to it).
- **Other → a jump** ("go to N" / "go to <thing>"): move to that stop out of
  order.
- **Other → a question** about the current code: answer it in place. Keep the
  editor where it is unless answering needs another location; if it does, drive
  there, then return to the tour stop afterward. Then ask again so the user can
  resume.
- **Done**: go to Step 5 (cleanup).

Choosing the range: highlight the smallest meaningful unit. A single statement,
guard clause, or signature is one line; a behavior that spans a loop body or a
short function is the enclosing block, capped at roughly 12-20 lines (one
screenful). If the relevant code is larger, split it into several stops and walk
down it, narrating each sub-section.

## Step 4: Highlight conventions (line math)
`walkthrough-goto.sh` takes **1-based, inclusive** start and end lines — the
same numbers in Neovim's gutter and the same `file:line` numbers you cite in
prose. Internally it converts to Neovim's 0-based API and iterates `l = start -
1` through `end - 1` inclusive, setting a per-line extmark in the `walkthrough`
namespace with `line_hl_group = 'Visual'`, so the range reads like a visual
selection. Extmarks do NOT modify buffer text: no unsaved changes, fully
reversible. Each `goto` clears the namespace in the current buffer before
re-applying, so only one range is ever lit.

## Step 5: End the walkthrough (cleanup)
When the tour finishes (the user says stop, or you reach the last stop), clear
the highlights so the editor is not left decorated. This clears the namespace in
every buffer the tour touched, regardless of which is current:
```sh
nvim-control ex "lua if _G.WT_NS then for _,b in ipairs(vim.api.nvim_list_bufs()) do pcall(vim.api.nvim_buf_clear_namespace, b, _G.WT_NS, 0, -1) end end"
```
Then ask whether to return the user to where they started (one more `goto` to
the `file`/`cursor` captured in Step 1) or leave them at the last stop. The
highlights were non-destructive, so nothing needs saving.

## Step 6: Graceful degradation
If a `goto` navigated correctly (`context_after` shows the right file and line)
but highlighting failed, continue the tour in plain-cursor mode: the centered
cursor line is the emphasis. Highlighting is an enhancement, not a requirement —
never abort a tour solely because extmarks failed.

## Notes
- Prefer `ex` + `:lua` over `keys`; never send raw keystrokes for navigation.
- Always pass absolute paths to `goto`.
- Column is irrelevant for a tour; the script always lands the cursor at column
  0 and lights the whole line.
- Switching buffers is non-destructive: with `hidden` on, a modified buffer
  stays loaded in the background, so the tour never discards the user's unsaved
  work.

User request: $ARGUMENTS
