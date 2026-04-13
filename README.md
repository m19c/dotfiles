# dotfiles

## Utilities

### `./install.sh`

To run the installation simply call `./install.sh`.

Platform-specific installer packages:

- `ghostty-linux` is installed on Arch (`.core/arch.sh`) and contains your current Ghostty config.
- `ghostty-mac` is installed on macOS (`.core/mac.sh`) and is currently a placeholder for your upcoming mac config.
- VS Code extensions are repo-managed in `vscode.txt` and installed via `.core/vscode.sh` when the `code` CLI is available.
- Arch package sources are repo-managed in `pacman.txt` and `aur.txt`.

### `github_clone_organization($organization)`

Clone the entire `$organization`.

```bash
github_clone_organization "something"
```
