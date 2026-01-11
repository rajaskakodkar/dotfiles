# Dotfiles

My personal dotfiles for macOS, featuring Fish shell, Tmux, Neovim, and Ghostty.

Inspired by:
- https://github.com/fastai/dotfiles
- https://github.com/fatih/dotfiles

## Quick Start
Clone repo
cd ~/Code git clone https://github.com/rajaskakodkar/dotfiles.git cd dotfiles

One-command setup
./setup.sh

## What's Included

- **Fish Shell**: Modern shell with smart completions
- **Tmux**: Terminal multiplexer with custom prefix (C-f)
- **Neovim**: Configured for Go development with LSP
- **Ghostty**: GPU-accelerated terminal with tmux integration
- **Git**: Aliases and SSH configuration

## Manual Setup

If you prefer step-by-step:

Install Homebrew packages
brew bundle

Create symlinks
make sync

Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Set fish as default shell
echo $(which fish) | sudo tee -a /etc/shells chsh -s $(which fish)

Restart terminal
exec fish

In tmux: Install plugins
Press: C-f I (capital I)
In nvim: Install Go binaries
Run: :GoInstallBinaries

## Important Post-Setup

### 1. macOS cmd+h Remap (Required for Ghostty)

To use cmd+h for tmux pane navigation:

1. Open **System Settings** > **Keyboard** > **Keyboard Shortcuts**
2. Click **App Shortcuts** in left sidebar
3. Click **+** button
4. **Application**: Select "Ghostty.app"
5. **Menu Title**: Type exactly `Hide Ghostty`
6. **Keyboard Shortcut**: Press `F9`
7. Click **Add**

After this, cmd+h navigates tmux panes, F9 hides Ghostty.

### 2. Create Work Git Config

mkdir -p ~/Code/ps cat > ~/Code/ps/gitconfig << 'EOF' [user] email = your-work-email@company.com EOF

### 3. Set Up GitHub SSH

Generate SSH key
ssh-keygen -t ed25519 -C "your@email.com"

Copy public key
cat ~/.ssh/id_ed25519.pub

Add to GitHub: Settings > SSH and GPG keys

## Documentation

- [Keyboard Shortcuts](docs/KEYBOARD_SHORTCUTS.md) - Complete cheat sheet
- [Gotchas](docs/GOTCHAS.md) - Common issues and solutions

## Key Features

### Ghostty + Tmux Integration

All cmd+ shortcuts send tmux commands:
- `cmd+d` - Split vertical
- `cmd+h/j/k/l` - Navigate panes
- `cmd+1-9` - Jump to windows
- `cmd+t` - New window

### Tmux Custom Prefix

- Prefix is `C-f` (not standard `C-b`)
- Double-tap `C-f` to toggle between last two windows
- Vim-style navigation and copy mode

### Neovim for Go

- LSP with gopls
- vim-go integration
- Treesitter syntax highlighting
- Leader key: `,`

## Makefile Commands

make sync # Create symlinks make install # Full setup make clean # Remove symlinks make help # Show help

