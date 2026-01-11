#!/bin/bash
# Complete setup script for dotfiles

set -e

echo "🚀 Dotfiles Setup"
echo "================="
echo ""

# Check if we're in the dotfiles directory
if [ ! -f "Makefile" ] || [ ! -f "config.fish" ]; then
    echo "❌ Error: Please run this script from the dotfiles directory"
    exit 1
fi

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for this session
    if [ -d "/opt/homebrew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew already installed"
fi

# Run make install
echo ""
echo "🔧 Running make install..."
make install

# Install Go tools
echo ""
echo "🔧 Installing Go tools..."
if command -v go &> /dev/null; then
    go install golang.org/x/tools/gopls@latest
    echo "✅ gopls installed"
else
    echo "⚠️  Go not found, skipping gopls installation"
fi

# Check for Ghostty
echo ""
if [ -d "/Applications/Ghostty.app" ]; then
    echo "✅ Ghostty installed"
    echo ""
    echo "⚠️  IMPORTANT: Set up cmd+h remap for Ghostty:"
    echo "   1. System Settings > Keyboard > Keyboard Shortcuts"
    echo "   2. App Shortcuts > + button"
    echo "   3. Application: Ghostty.app"
    echo "   4. Menu Title: Hide Ghostty"
    echo "   5. Keyboard Shortcut: Press F9"
else
    echo "⚠️  Ghostty not found at /Applications/Ghostty.app"
    echo "   Install with: brew install --cask ghostty"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Restart your terminal (or run: exec fish)"
echo "2. Open tmux and press C-f I (capital I) to install plugins"
echo "3. Open nvim (first launch will install plugins, be patient!)"
echo "4. In nvim, run: :GoInstallBinaries"
echo "5. Set up the cmd+h remap (see above)"
echo ""
echo "📚 Documentation available in:"
echo "   - README.md (overview)"
echo "   - docs/KEYBOARD_SHORTCUTS.md (cheat sheet)"
echo "   - docs/GOTCHAS.md (common issues)"
echo ""

