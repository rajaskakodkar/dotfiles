# Path setup with dynamic Homebrew detection
set -l BREW_PREFIX
if test -d /opt/homebrew
    set BREW_PREFIX /opt/homebrew
else if test -d /usr/local
    set BREW_PREFIX /usr/local
end

# Build PATH
set -gx PATH \
    $HOME/go/bin \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $BREW_PREFIX/bin \
    $BREW_PREFIX/sbin \
    /usr/local/bin \
    /usr/bin \
    /bin \
    /usr/local/sbin \
    /usr/sbin \
    /sbin

# Add versioned Homebrew packages dynamically
if test -n "$BREW_PREFIX"
    # Python
    for py in $BREW_PREFIX/opt/python@3.*/libexec/bin
        if test -d $py
            set -gxp PATH $py
            break
        end
    end
    
    # Node
    for node in $BREW_PREFIX/opt/node@*/bin
        if test -d $node
            set -gxp PATH $node
            break
        end
    end
    
    # PostgreSQL
    for pg in $BREW_PREFIX/opt/postgresql@*/bin
        if test -d $pg
            set -gxp PATH $pg
            break
        end
    end
end

# Environment variables
set -gx GOBIN $HOME/go/bin
set -gx EDITOR nvim
set -gx FZF_CTRL_T_COMMAND "fd --type f --hidden --follow --exclude .git"
set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"

# Ghostty shell integration (with existence check)
if test -d /Applications/Ghostty.app/Contents/Resources/ghostty/shell-integration
    set -gx GHOSTTY_SHELL_INTEGRATION_XDG_DIR /Applications/Ghostty.app/Contents/Resources/ghostty/shell-integration
end

# Git prompt settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_cleanstate '✓'
set -g __fish_git_prompt_char_dirtystate '⚡'
set -g __fish_git_prompt_char_invalidstate '✖'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_stashstate '⚑'
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_char_upstream_ahead '↑'
set -g __fish_git_prompt_char_upstream_behind '↓'
set -g __fish_git_prompt_color_branch yellow
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold

# macOS-specific: Disable slow command descriptions
# See: https://github.com/fish-shell/fish-shell/issues/6270
if test (uname) = Darwin
    function __fish_describe_command; end
end

# Tool integrations
if type -q atuin
    set -gx ATUIN_NOBIND true
    atuin init fish | source
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search
end

if type -q zoxide
    zoxide init fish | source
end

if type -q direnv
    direnv hook fish | source
end

