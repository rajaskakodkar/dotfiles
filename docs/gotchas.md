# Common Gotchas & Pitfalls

## Ghostty

### ⚠️ cmd+h Requires System Remap
- **Problem**: cmd+h doesn't navigate tmux panes
- **Cause**: macOS uses cmd+h to hide windows by default
- **Fix**: System Settings > Keyboard > Shortcuts > App Shortcuts
  - Add: Ghostty.app > "Hide Ghostty" > F9
- **After**: cmd+h works for tmux, F9 hides Ghostty

### ⚠️ Keybindings Only Work in Tmux
- **Problem**: cmd+d, cmd+h/j/k/l don't do anything
- **Cause**: Keybindings send tmux commands
- **Fix**: Always start tmux when opening Ghostty
- **Command**: `tmux` or `tmux attach`

### ⚠️ Font Not Found
- **Problem**: Terminal looks different than expected
- **Cause**: TX-02 font not installed
- **Fix**: Install the font or change `font-family` in config

## Tmux

### ⚠️ Non-Standard Prefix
- **Problem**: Following tutorials doesn't work
- **Cause**: Your prefix is C-f, most use C-b
- **Fix**: Mentally translate C-b to C-f in tutorials

### ⚠️ Plugins Not Working
- **Problem**: Status bar looks broken, features missing
- **Cause**: TPM not installed or plugins not installed
- **Fix**: 
  1. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
  2. In tmux: `C-f I` (capital I)

### ⚠️ Window Naming Script Missing
- **Problem**: Window names show as literal `#{b:pane_current_path}`
- **Cause**: ~/.tmux-window-name.sh doesn't exist
- **Fix**: `ln -s ~/Code/dotfiles/tmux-window-name.sh ~/.tmux-window-name.sh`

### ⚠️ Nested Tmux
- **Problem**: Prefix doesn't work after SSH
- **Cause**: Nested tmux sessions
- **Fix**: Press prefix twice: `C-f C-f c` for inner tmux

## Neovim

### ⚠️ First Launch is Slow
- **Problem**: Nvim takes 30-60 seconds to start
- **Cause**: Lazy.nvim installing all plugins
- **Fix**: Be patient, only happens once

### ⚠️ Go Commands Don't Work
- **Problem**: :GoRun, :GoBuild fail
- **Cause**: vim-go binaries not installed
- **Fix**: In nvim, run `:GoInstallBinaries`

### ⚠️ No Syntax Highlighting
- **Problem**: Code has no colors
- **Cause**: Treesitter parsers not compiled
- **Fix**: 
  1. Install Xcode Command Line Tools: `xcode-select --install`
  2. In nvim: `:TSUpdate`

### ⚠️ LSP Not Working
- **Problem**: No autocomplete, no go-to-definition
- **Cause**: Language servers not installed
- **Fix**:
  - Go: `go install golang.org/x/tools/gopls@latest`
  - Lua: `brew install lua-language-server`

### ⚠️ Stuck in Insert Mode
- **Problem**: Can't execute commands
- **Cause**: In insert mode, not normal mode
- **Fix**: Press `Esc` to return to normal mode

### ⚠️ Accidental Deletions
- **Problem**: Typed something and text disappeared
- **Cause**: Typed vim commands in normal mode
- **Fix**: `u` to undo, be aware of current mode

## Fish Shell

### ⚠️ Not Default Shell
- **Problem**: Terminal still opens with bash/zsh
- **Cause**: Default shell not changed
- **Fix**:
  1. `echo $(which fish) | sudo tee -a /etc/shells`
  2. `chsh -s $(which fish)`
  3. Restart terminal

### ⚠️ PATH Not Working
- **Problem**: Commands not found after Homebrew upgrade
- **Cause**: Hardcoded version paths (python@3.11, node@20)
- **Fix**: Already fixed with dynamic path detection in config.fish

### ⚠️ Atuin Not Bound
- **Problem**: Ctrl+R doesn't work
- **Cause**: Atuin not installed or not initialized
- **Fix**: `brew install atuin`, restart fish

## Git

### ⚠️ SSH Authentication Failed
- **Problem**: Can't clone/push to GitHub
- **Cause**: HTTPS URLs converted to SSH, but no SSH keys
- **Fix**:
  1. Generate key: `ssh-keygen -t ed25519 -C "your@email.com"`
  2. Copy key: `cat ~/.ssh/id_ed25519.pub`
  3. Add to GitHub: Settings > SSH and GPG keys

### ⚠️ Wrong Email in Commits
- **Problem**: Commits show wrong email in work repos
- **Cause**: ~/Code/ps/gitconfig doesn't exist or has wrong email
- **Fix**: Create/edit `~/Code/ps/gitconfig`:

