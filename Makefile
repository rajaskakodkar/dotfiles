.PHONY: all sync install clean help

all: sync

help:
	@echo "Dotfiles Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make sync     - Create symlinks for all dotfiles"
	@echo "  make install  - Full setup (Homebrew, symlinks, shell)"
	@echo "  make clean    - Remove all symlinks"
	@echo "  make help     - Show this help"

sync:
	@echo "Creating directories..."
	mkdir -p ~/.config/fish
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/ghostty
	mkdir -p ~/.tmux/

	@echo "Creating symlinks..."
	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/config.fish ~/.config/fish/config.fish
	[ -d ~/.config/fish/functions/ ] || ln -s $(PWD)/fish/functions ~/.config/fish/functions
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.config/nvim/init.lua ] || ln -s $(PWD)/init.lua ~/.config/nvim/init.lua
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.config/ghostty/config ] || ln -s $(PWD)/ghostty.config ~/.config/ghostty/config
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.tmux-window-name.sh ] || ln -s $(PWD)/tmux-window-name.sh ~/.tmux-window-name.sh
	
	@echo "✅ Symlinks created!"

install: sync
	@echo "Installing Homebrew packages..."
	brew bundle
	
	@echo "Installing TPM (Tmux Plugin Manager)..."
	[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	
	@echo "Creating work git config..."
	mkdir -p ~/Code/ps
	[ -f ~/Code/ps/gitconfig ] || echo "[user]\n\temail = your-work-email@company.com" > ~/Code/ps/gitconfig
	
	@echo "Setting fish as default shell..."
	@if ! grep -q $$(which fish) /etc/shells; then \
		echo $$(which fish) | sudo tee -a /etc/shells; \
	fi
	@if [ "$(SHELL)" != "$$(which fish)" ]; then \
		chsh -s $$(which fish); \
		echo "⚠️  Shell changed to fish. Please restart your terminal."; \
	fi
	
	@echo ""
	@echo "✅ Installation complete!"
	@echo ""
	@echo "Next steps:"
	@echo "1. Restart terminal"
	@echo "2. Open tmux and press C-f I to install plugins"
	@echo "3. Open nvim (will auto-install plugins)"
	@echo "4. In nvim, run :GoInstallBinaries"
	@echo "5. Set up macOS cmd+h remap (see ghostty.config comments)"

clean:
	@echo "Removing symlinks..."
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/fish/functions
	rm -f ~/.vimrc
	rm -f ~/.config/nvim/init.lua
	rm -f ~/.tigrc
	rm -f ~/.gitconfig
	rm -f ~/.config/ghostty/config
	rm -f ~/.tmux.conf
	rm -f ~/.tmux-window-name.sh
	@echo "✅ Symlinks removed!"

