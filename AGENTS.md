# Repository guidelines
## Project structure and module organization
This is a GNU Stow dotfiles repository that links top-level dotfiles into
`$HOME`.

### Layout
- Put XDG app configuration under `.config/<tool>/`, personal commands in
  `.bin/`, and Hammerspoon Lua in `.hammerspoon/`.
- Keep generated agent state, sockets, backups, and machine-local lock files out
  of commits.
- `.stow-local-ignore` excludes Git metadata, local-only files, and all Markdown
  (`.md$`) from linking, so documentation like this one lives in this
  repository only.

### Editing symlinked files
- Always edit files in this repository, never their symlink targets. A path like
  `~/.config/zsh/.zshrc` resolves back into this repository, so editing the
  target works but obscures which repository file changed.
- Resolve a tool to its source with `readlink -f "$(command -v <tool>)"` when in
  doubt.
- Do not re-run Stow after editing existing files. The target is a symlink, so
  the edit already changes the live configuration. Re-run Stow only to link
  newly added files.

### Submodules
- Track Neovim plugins and Hammerspoon Spoons as Git submodules under
  `.config/nvim/pack/packages/start/` and `.hammerspoon/Spoons/`.
- Add new plugins and Spoons as submodules rather than vendoring files.
- Never edit submodule contents as if they were local source.
- Run `git submodule update --init --recursive` after cloning or pulling.

### Tooling
- Add or bump development tools in `.config/mise/config.toml` (pinned by
  `mise.lock`), then run `mise install`. `mise` owns tool versions, not a
  package manager.
- Trust a fresh checkout once with `mise trust` before running `mise`.
- Create XDG state and cache directories as part of machine setup; they are not
  created on demand, so a configuration writing to a new XDG location needs its
  directory created first.

## Where to make changes
| Change | Location |
|--------|----------|
| Zsh aliases and functions | `.config/zsh/aliases.zsh` |
| Zsh prompt | `.config/zsh/prompt.zsh` |
| Environment variables: `PATH`, `EDITOR`, history | `.config/zsh/env.zsh` |
| `ZDOTDIR` and XDG base directories (sourced first, every shell) | `.zshenv` |
| Zsh completions | `.config/zsh/completions.zsh` |
| External tool initialization (`mise`, `cargo`) | `.config/zsh/externals.zsh` |
| Git configuration and aliases | `.config/git/config` |
| Terminal (Ghostty) | `.config/ghostty/config` |
| Tool versions | `.config/mise/config.toml` |
| Window automation (Hammerspoon) | `.hammerspoon/init.lua` |
| Neovim configuration | `.config/nvim/`, entry `init.lua` |
| Personal command-line scripts | `.bin/` |

## Build, test, and development commands
- `git submodule update --init --recursive`: initialize cloned submodules.
- `stow -n -v .`: preview symlinks and conflicts without writing into `$HOME`.
- `stow --restow .`: (re)link the dotfiles into `$HOME` after reviewing the dry
  run. Prefer `--restow` over plain `stow .`; it unlinks then relinks, so it is
  safe to re-run on an existing install and clears stale links.
- `.bin/initialize-macos-defaults`: apply this setup's macOS defaults.
- Check Lua formatting with:
  ```sh
  stylua --check --config-path .config/stylua/stylua.toml \
    .config/nvim .hammerspoon
  ```

## Coding style and naming conventions
- Format Lua with Stylua using `.config/stylua/stylua.toml`: two-space indents,
  Unix line endings, and explicit call parentheses.
- Keep Zsh and shell files lowercase, scoped by purpose, and placed near the
  tool they configure.
- Name executables in `.bin/` with concise kebab-case commands, such as
  `tmux-git-branch`.

## Testing guidelines
There is no central test suite. Validate the exact area touched before
committing:
- Run `stow -n -v .` for link changes.
- Run `zsh -n .config/zsh/*.zsh` for Zsh syntax.
- Run `nvim --headless '+quitall'` for Neovim startup changes.
- Run a shell script's dry-run or harmless path when available, then `sh -n` or
  `shellcheck` if installed.
- Validate Hammerspoon changes by reloading the configuration and exercising
  the affected behavior; there is no headless test.

## Commit and pull request guidelines
- Commit dotfiles changes directly to `main`; do not create feature branches.
  This repository is an exception to the global feature-branch rule.
- Write subjects in sentence case with a final period, for example `Show other
  client sessions in the session jumper.`
- Pull requests are unusual here, but when one is opened, describe the affected
  tools, list validation commands and results, link related issues, and include
  screenshots for visible terminal, editor, or UI changes.

## Security and configuration tips
- Never commit secrets, credentials, private keys, tokens, host-specific caches,
  or generated agent logs.
- Know that `.gitignore` ignores directories like `.ssh/`, `.gnupg/`,
  `.config/gh/`, `.claude/`, and `.codex/` wholesale, then re-includes specific
  files with `!` exceptions. A new file under one of these directories is
  silently ignored until a matching `!` allowlist entry exists.
- Check `.gitignore` and confirm with `git status` whenever a configuration
  change there does not appear.
