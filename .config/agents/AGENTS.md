# AGENTS.md
## General
- If a project contains AI tool configuration files (e.g., `CLAUDE.md`,
  `.cursorrules`, `.windsurfrules`, etc.), use those as references for
  project-specific guidelines.
- Show code examples when describing concepts.

## Workflow
- Stop commands running longer than 5 minutes and check with the user.
  Long-running processes may indicate an issue or inefficient approach.
- Search before proposing solutions. Understand what exists in the codebase
  before suggesting new implementations.

### Quality gates and tooling
If a quality gate (tests, linters, type checkers, build steps) fails due to
missing tools:
1. Install or configure the missing tool
2. Re-run the quality gate
3. Fix any issues it reveals

Never skip quality gates due to missing tooling. If you cannot install a tool,
ask the user for help rather than proceeding without it.

## Coding style
### Development workflow
- Use TDD for features and bug fixes unless stated otherwise. Add or adjust
  tests that define expected behavior before changing implementations, and use
  a red-green-refactor cycle.
- For refactors and tidyings, rely on existing coverage. If behavior is not
  already captured, add or shore up targeted tests before changing code; do not
  invent new behavior during tidyings.
- When tidyings touch separate parts of the code and can work in isolation,
  commit them separately. If in doubt, default to separate commits with a green
  test suite.

### Core principles
- Think deeply before acting. Consider architecture, existing patterns, and
  trade-offs before proposing solutions.
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

### Abstraction and design
- Question complex and premature abstractions and opt for simpler alternatives.
  Avoid indirection that does not reduce coupling or enable variation. When
  considering abstraction, ask "Does this enable variation that I need TODAY?".
  If no, inline it or keep it simple.
- When encountering over-abstraction, e.g., unnecessary indirection with only
  one implementation, inline it to remove the complexity.
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
- Place modules where they belong semantically. A geometry module used only by
  layouts belongs in `layouts/geometry.lua`, not `utils/geometry.lua`.

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
- Unit tests should be fast, isolated and, ideally, require no external
  dependencies. Test each unit in isolation.
- Include only a single assertion per test when possible. Multiple assertions
  are acceptable when they verify a single behavior, e.g., "user login updates
  last_login_at AND returns success token" is one behavior.
- Tests are documentation, and a new developer should be able to understand
  behavior by reading the tests.
- Test edge cases and boundary conditions, including empty inputs, null/nil
  values, maximum/minimum values, and error states. These tests prevent common
  bugs and clarify expected behavior at the boundaries.

## Documentation
- Comments should explain "why" instead of "what" and only when the code intent
  is unclear, for instance, when business rules, non-obvious algorithms,
  performance trade-offs or other constraints are not evident from the names or
  types.
- Prefer self-documenting code such as clear names and types over prose.
- For type-safe languages, let type signatures carry meaning, and do not
  duplicate types in comments.
- Document non-obvious constraints and assumptions.

## Language-specific guidance
### Markdown
- Omit blank lines after headings (h1-h6) and bold text. Content should
  immediately follow on the next line for compact formatting.

### TypeScript
- Never use `any`. Model real shapes with proper types instead of resorting
  to escape hatches.
- Avoid `as` type assertions. Trust the type system and fix type issues at
  their source rather than casting around them.

## Git
### Workflow
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
     created for user review are included
3. If you find gaps within the original scope, amend the relevant commit
4. If you identify potential improvements outside the original scope, ask the
   user first

The goal is ensuring completeness within scope, not perfection beyond it.

**Note on temporary artifacts**: Files created during planning or analysis
(design docs, review notes, diagrams) are usually not part of the deliverable.
Only commit documentation if explicitly requested or if it's standard for the
project (e.g., ADRs). When in doubt, ask.

### Commit messages
When writing commit messages stick to the following practices:
- Use 50-characters max for the subject line.
- Keep longer descriptions wrapped at 72 characters. The descriptions should
  answer:
  - Why was this change necessary?
  - How does it address the problem?
  - Are there any side effects?
- Include a link to the ticket, if any.

### Branch naming
- Use descriptive prefixes, e.g., `feature/`, `fix/`, `docs/`, etc.
- Include ticket numbers if applicable, e.g., `feature/project-123-user-auth`.
- Keep names short but descriptive, e.g., `fix/login-redirect-loop`.
- Use kebab-case for consistency.
- Delete branches after merging to keep repository clean.

## Editor context
- When a user asks about their cursor position, current method, current file,
selection, or other editor state, automatically invoke `nvim-context` to fetch
live context before responding.
