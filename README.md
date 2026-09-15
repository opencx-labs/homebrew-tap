# homebrew-tap

Homebrew packages for Catamorphic and difu.

## difu

```sh
brew install opencx-labs/tap/difu
```

Homebrew adds this tap automatically and installs a prebuilt difu binary for
macOS or Linux (Intel/AMD or ARM64). No Rust installation is required.

Git, GitHub CLI (`gh`), and Codex CLI must already be installed and on your `PATH`.
The difu package does not install or bundle these tools. Authenticate if needed:

```sh
gh auth login
codex login
difu
```

See [difu's documentation](https://github.com/opencx-labs/difu#readme) for controls,
requirements, and worktree behavior.
