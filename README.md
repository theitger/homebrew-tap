# homebrew-tap

Homebrew formulae by [@theitger](https://github.com/theitger).

## lernspiegel

Mirror your [Uni Münster Learnweb](https://github.com/theitger/lernspiegel) (Moodle)
courses to local files — CLI + credential-free MCP server for AI coding agents.

```sh
brew install theitger/tap/lernspiegel
```

This installs two commands:

- `learnweb` — the CLI (`learnweb login`, `learnweb sync`, …)
- `learnweb-mcp` — the token-free MCP server over the local mirror

Then:

```sh
learnweb login
learnweb sync
```

macOS only (the API token is stored in the system Keychain).

### Updating

New releases: bump `url` + `sha256` in `Formula/lernspiegel.rb`, then users run
`brew upgrade lernspiegel`.

## Reaper

Menu bar app that frees the memory [coding agents leave behind](https://github.com/theitger/agent-reaper):
orphaned agent-browser sessions, idle Docker stacks, forgotten apps.

```sh
brew install --cask theitger/tap/agent-reaper
xattr -dr com.apple.quarantine /Applications/Reaper.app
```
