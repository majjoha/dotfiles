# CLAUDE.md
## General
- If a project contains AI tool configuration files (e.g., `CLAUDE.md`,
  `.cursorrules`, `.windsurfrules`, etc.), use those as references for
  project-specific guidelines.
- Show code examples when describing concepts.

## Coding style
### Development workflow
- Use TDD for features and bug fixes unless stated otherwise. Always add tests
  before refactoring, use red-green-refactor cycle and implement only the
  minimum code required to make the tests pass.
- Tidyings (small structural improvements like renaming, extracting methods,
  reordering, or moving code) are part of the refactor phase and should be
  covered by existing tests. Only write new tests if existing coverage is
  insufficient.
- When tidyings touch separate parts of the code and can work in isolation,
  commit them separately. If in doubt, default to separate commits with a green
  test suite.

### Core principles
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
- Comments should explain "why" instead of "what" and only when the code intent
  is unclear, for instance, when business rules, non-obvious algorithms,
  performance trade-offs or other constraints are not evident from the names or
  types.
- Keep line length to 80 characters maximum for all files (code, documentation,
  configuration, etc.). This ensures readability across different editors and
  environments.
- For Markdown files, omit blank lines after headings (h1-h6) and bold text.
  Content should immediately follow on the next line for compact formatting.

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
- DRY applies after reaching the Rule of Three threshold. Duplication is
  acceptable and often preferred before that point.
- Apply SOLID principles to solve current problems and not future hypothetical
  ones. When SOLID and YAGNI conflict, choose YAGNI.
- For OOP, opt for composition over inheritance.

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
  dependencies. Test each class in isolation.
- Include only a single assertion per test when possible. Multiple assertions
  are acceptable when they verify a single behavior, e.g., "user login updates
  last_login_at AND returns success token" is one behavior.
- Tests are documentation, and a new developer should be able to understand
  behavior by reading the tests.

## Documentation
- Document "why" decisions were made, not "what" the code does.
- Prefer self-documenting code such as clear names and types over prose.
- For type-safe languages, let type signatures carry meaning, and do not
  duplicate types in comments.
- Document non-obvious constraints and assumptions.

## Git
### Workflow
- Always use feature branches or worktrees. Never commit directly to `main`
  unless explicitly asked to.
- Keep commits small and atomic. They should include changes that can be viewed
  as isolated units instead of multiple components.
- Never use `--no-verify` without explicit user permission.

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
