# AGENTS.md
## Workflow
- Never `git add` planning artifacts (review files, analysis docs, design notes)
  created during a task. These are disposable working documents. Delete them
  before committing or place them outside the repository, so they are kept but
  not tracked. The "before pushing" checklist is a safety net, not the primary
  defense.
- For long-form output (reviews, plans, analyses exceeding ~100 lines), write to
  a Markdown file in the project directory and tell the user the path. This
  preserves context window tokens and gives the user a persistent, reviewable
  artifact.
- Stop commands running longer than 5 minutes and check with the user.
  Long-running processes may indicate an issue or inefficient approach.
- Search before proposing solutions. Understand existing code, patterns, and
  trade-offs before suggesting changes.
- When debugging or investigating, gather evidence (logs, return values,
  actual vs. expected behavior) before proposing fixes. Do not guess.
- Only change what the task requires. Do not refactor, reformat, or "improve"
  nearby code unless explicitly asked.
- When asked to find bugs or review code, present only what was asked for.
  Do not bundle feature suggestions, documentation ideas, or speculative
  improvements into bug reports.
- Never claim a task is complete without verifying it works. Run tests, build,
  or demonstrate the output.
- Verify each change works before moving to the next one. Do not batch
  multiple changes and only test the final result. If a change breaks
  something, it should be obvious which one caused it.

### Quality gates and tooling
If a quality gate (tests, linters, type checkers, build steps) fails due to
missing tools:
1. Install or configure the missing tool
2. Re-run the quality gate
3. Fix any issues it reveals

Never skip quality gates due to missing tooling. If you cannot install a tool,
ask the user for help rather than proceeding without it.

### Development workflow
- Use TDD for features and bug fixes unless stated otherwise. Add or adjust
  tests that define expected behavior before changing implementations, and use
  a red-green-refactor cycle.
- For refactors that preserve existing behavior, rely on existing coverage. If
  behavior is not already captured, add or shore up targeted tests before
  changing code; do not invent new behavior during refactors.
- When refactors touch separate parts of the code and can work in isolation,
  commit them separately. If in doubt, default to separate commits with a green
  test suite.
- Commit after each logically complete change rather than accumulating
  uncommitted work across multiple steps. Every commit must pass quality
  gates before being created.

## Coding style
### Core principles
- Fix root causes, not symptoms. Solve problems from first principles rather
  than applying band-aids.
- Prefer immutability over mutation, avoid side-effects, and keep actions
  idempotent.
- Use declarative code when it improves readability. Favor clear, composable
  operations (map/filter/reduce, expressions over statements) over manual loops
  when the intent becomes more obvious. If declarative code becomes complex
  (deeply nested chains, obscure reduce operations), prefer explicit imperative
  code.
- Extract magic values to well-named constants rather than leaving them inline.

### Readability
- Always write for humans: descriptive variable and function names,
  self-documenting code, and boring over clever. A reader familiar with the
  language should be able to understand "what" from reading the code.
- Keep line length to 80 characters maximum for all files (code, documentation,
  configuration, etc.). This ensures readability across different editors and
  environments.
- When writing prose (documentation, Markdown, comments), fill lines to 80
  characters by breaking at word boundaries. Lines should reach 80 characters
  before wrapping; only the final line of a paragraph may be shorter. Do not
  wrap conservatively at 65-70 characters — 80 is a target to fill to, not
  just a ceiling to stay under. Exception: Git commit message subjects
  (50 chars) and bodies (72 chars) have their own limits.

### Abstraction and design
- Question complex and premature abstractions and opt for simpler alternatives.
  Avoid indirection that does not reduce coupling or enable variation. When
  considering abstraction, ask "Does this enable variation that I need TODAY?".
  If no, inline it or keep it simple.
- Tolerate duplication until the third occurrence (Rule of Three), then
  abstract only if the pattern is stable. Two instances of similar code are not
  yet a pattern. You may abstract earlier if a third occurrence is imminent AND
  the pattern is clearly stable, but default to waiting.
- Apply SOLID principles only when they solve a current problem. When SOLID
  requires speculative abstraction, choose YAGNI.
- For OOP, opt for composition over inheritance.

### File organization
- Avoid catch-all directories like `utils/`, `helpers/`, `common/`, or
  `shared/`. These become dumping grounds for unrelated code with no cohesion.

### Type discipline
- Never use escape hatches (`any`, `unknown` in TypeScript; `any`, `@cast` in
  Lua annotations). If a type cannot be expressed, redesign the API rather than
  silencing the type checker.
- Model domain concepts as distinct types, not bare primitives. A `WindowID`
  and a `SpaceID` are both integers but are not interchangeable — make them
  nominally distinct so the type checker rejects accidental interchange.
- Represent closed sets as union types, not strings. A hook type that accepts
  `"window_created"` or `"layout_changed"` is safer than one that accepts
  `string`.
- Use the narrowest type that matches runtime behavior. If a function
  guarantees a value is present, the return type must not include
  `nil`/`undefined`/`null`. Overly permissive types force callers into dead
  defensive code and hide real bugs.
- Prefer typed structures over generic containers (`Map<string, number>` over
  `object`; `table<string, number>` over `table`).
- Prefer explicit callback signatures over generic function types.
  `(id: WindowID, floating: boolean) => void` is safer than `Function` in
  TypeScript; `fun(id: WindowID, floating: boolean)` is safer than `function`
  in Lua annotations.

### Project conventions
- Always ask before introducing third-party libraries, including production
  dependencies, development dependencies (test frameworks, linters, formatters),
  and standard library extensions that are not built in. Any dependency can
  bring bugs, security risks, or maintenance burden.
- Follow project-specific conventions and community-standard style guides for
  each language, e.g., Rubocop for Ruby. When language and project guidelines
  conflict, ask for clarification.
- Use linters and formatters configured for the project. Don't manually format.

## Testing
- Test behavior, not implementation.
- Unit tests should be fast, isolated, and free of external dependencies when
  possible.
- Include only a single assertion per test when possible. Multiple assertions
  are acceptable when they verify a single behavior, e.g., "user login updates
  last_login_at AND returns success token" is one behavior.
- Tests are documentation, and a new developer should be able to understand
  behavior by reading the tests.
- Test edge cases and boundary conditions, including empty inputs, null/nil
  values, maximum/minimum values, and error states. These tests prevent common
  bugs and clarify expected behavior at the boundaries.

## Documentation
### Comments
Write comments that explain "why", not "what". The code itself should
be self-documenting through clear names and structure.

**When to comment:**
- Architectural decisions (why this pattern, not alternatives)
- Non-obvious constraints (timing, race conditions, API limitations)
- Edge cases and fallback behaviors
- Performance optimizations (caching strategies, complexity notes)
- Public API contracts (preconditions, side effects, error behavior)

**When not to comment:**
- What the code does (assignments, function calls, conditionals)
- Type information (use the type system instead)
- Obvious validations or checks
- Play-by-play descriptions of algorithms

**Examples:**

Bad (explains "what"):
```lua
-- Check if window is floating
if windows.isFloating(window) then
  return
end

-- Get all windows from filter
local allWindows = shoji.windowFilter:getWindows()
```

Good (explains "why"):
```lua
-- Capture insertion point before delays to maintain
-- natural window ordering
local focusedBeforeCreation = hs.window.focusedWindow()

-- Periodically validate cache to detect windows moved
-- between spaces
local shouldValidateCycle =
  (now - _lastCacheValidation >= INTERVAL)
```

**If in doubt:** Prefer clear variable and function names over comments. A
well-named function like `shouldIgnoreEvents()` is better than a comment
saying "Check if we should ignore events".

## Language-specific guidance
### Lua
- Always declare variables with `local`. Lua defaults to global scope, and
  omitting `local` causes stale state across reloads and leaks between files.
- Annotate functions and fields with EmmyLua type annotations (`---@param`,
  `---@return`, `---@alias`, `---@field`).

### Markdown
- Omit blank lines after headings (h1-h6) and bold text. Content should
  immediately follow on the next line for compact formatting.

### Ruby
- Favor FP over OOP but don't be dogmatic. Prefer immutability, pure methods and
  declarative pipelines (`select`/`map`/`reduce`) while following Ruby community
  conventions.
- Follow Rubocop rules configured for the project. Do not disable cops without
  explicit permission.

### TypeScript
- Use branded types to enforce domain type distinctions at compile time. Plain
  type aliases (`type WindowID = number`) are structurally identical to their
  base type and provide no safety. Branded types add a phantom property that
  makes structurally similar types incompatible.

## Git
### Branching and commits
- Always use feature branches or worktrees. Never commit directly to `main`
  unless explicitly asked to.
- Keep commits small and atomic. They should include changes that can be viewed
  as isolated units instead of multiple components.
- Never use `--no-verify` without explicit user permission.

### Before pushing
Before pushing commits, perform a final review:
1. Re-read the original task requirements
2. For each commit, verify:
   - All acceptance criteria are met
   - Edge cases are handled
   - Tests cover the changes
   - No debug code, TODOs, or temporary files remain
   - No planning artifacts (design docs, code review notes, analysis files)
     created during the task are included — only commit documentation if
     explicitly requested or standard for the project (e.g., ADRs)
3. Verify all commits ahead of the remote are GPG-signed:
   ```sh
   git log --format='%H %G?' @{u}..HEAD
   ```
   Any commit showing `N` (no signature) must be signed. To
   sign all unsigned commits from the fork point onward:
   ```sh
   git rebase --exec 'git commit --amend --no-edit -S' @{u}
   ```
   After signing, push with `--force-with-lease`.
4. If you find gaps within the original scope, amend the relevant commit
5. If you identify potential improvements outside the original scope, ask the
   user first
6. Self-review: identify weaknesses in the implementation. What edge
   cases are untested? What would you change if redoing this? Fix
   gaps before presenting the work as complete.

The goal is ensuring completeness within scope, not perfection beyond it.

### Commit messages
When writing commit messages stick to the following practices:
- Use 50-characters max for the subject line.
- Keep longer descriptions wrapped at 72 characters. The descriptions should
  answer:
  - Why was this change necessary?
  - How does it address the problem?
  - Are there any side effects?
- Include a link to the ticket, if any.

### Codex-specific
- When you create a git commit, keep your chosen subject/body, then append
  a blank line and this trailer:
  `Co-Authored-By: Codex <223734131+codex@users.noreply.github.com>`
  Use `git commit -m "..."` and add a second `-m` with the trailer to
  guarantee the blank line.

### Branch naming
- Use descriptive prefixes, e.g., `feature/`, `fix/`, `docs/`, etc.
- Include ticket numbers if applicable, e.g., `feature/project-123-user-auth`.
- Keep names short but descriptive, e.g., `fix/login-redirect-loop`.
- Use kebab-case for consistency.
- Delete branches after merging to keep repository clean.

## Self-improvement
When you encounter a situation where:
- You had to ask a clarifying question that a guideline could have prevented.
- The user corrected your approach and the correction reflects a general
  preference, not a one-off.
- A guideline was ambiguous and you had to interpret it.
- You discovered a pattern that consistently leads to better outcomes but is not
  yet documented.

Propose a specific amendment to this file. Present the exact diff to the user
for approval. Never modify this file without explicit consent.

## Editor context
- When a user asks about their cursor position, current method, current file,
  selection, or other editor state, automatically invoke `nvim-context` to fetch
  live context before responding.
