# Keyboard Shortcuts Cheat Sheet

## Ghostty (requires tmux!)

### Basic
- `cmd+n` - New window
- `cmd+q` - Quit
- `F9` - Hide (after system remap)
- `cmd+shift+,` - Reload config
- `cmd+f` - Search
- `cmd++/-/0` - Font size

### Tmux Integration
- `cmd+t` - New tmux window
- `cmd+w` - Close pane
- `cmd+1-9` - Jump to window
- `cmd+d` - Split vertical
- `cmd+shift+d` - Split horizontal
- `cmd+h/j/k/l` - Navigate panes
- `cmd+shift+[/]` - Previous/next window
- `cmd+shift+enter` - Zoom pane

## Tmux (prefix = C-f)

### Sessions
- `tmux` - New session
- `tmux attach` - Attach to last
- `C-f d` - Detach
- `C-f $` - Rename session

### Windows
- `C-f c` - New window
- `C-f ,` - Rename window
- `C-f 0-9` - Jump to window
- `C-f n/p` - Next/previous
- `C-f C-f` - Toggle last two
- `C-f &` - Kill window

### Panes
- `C-f v` - Split vertical (100 cols)
- `C-f s` - Split horizontal (30 rows)
- `C-f |` - Split vertical (50/50)
- `C-f -` - Split horizontal (50/50)
- `C-f h/j/k/l` - Navigate
- `C-f H/J/K/L` - Resize
- `C-f z` - Zoom toggle
- `C-f x` - Kill pane

### Copy Mode
- `C-f [` - Enter copy mode
- `Space/v` - Start selection
- `y/Enter` - Copy
- `C-f ]` - Paste
- `/` - Search forward
- `n/N` - Next/previous match

### Misc
- `C-f r` - Reload config
- `C-f ?` - List keybindings
- `C-f :` - Command mode
- `C-f I` - Install TPM plugins

## Neovim (leader = ,)

### Modes
- `i/a/o` - Insert mode
- `Esc` - Normal mode
- `v/V/C-v` - Visual mode
- `:` - Command mode

### Navigation
- `h/j/k/l` - Left/down/up/right
- `w/b` - Word forward/back
- `0/$` - Start/end of line
- `gg/G` - Top/bottom of file
- `C-d/C-u` - Half page down/up
- `%` - Matching bracket

### Editing
- `dd/yy/p` - Delete/copy/paste line
- `x` - Delete char
- `u/C-r` - Undo/redo
- `ciw` - Change inner word
- `ci"/ca"` - Change inside/around quotes

### Search
- `/pattern` - Search forward
- `n/N` - Next/previous
- `*/#` - Search word under cursor

### Files
- `:w/:q/:wq` - Save/quit/both
- `,w` - Save
- `,q` - Quit
- `,x` - Save and quit

### Go Development
- `,r` - Run file
- `,b` - Build
- `,t` - Run tests
- `,a` - Alternate (test/code)
- `gd` - Go to definition
- `K` - Show docs

### Text Objects
- `vif/vaf` - Select function
- `via/vaa` - Select parameter
- `]]` - Next function
- `,sn/,sp` - Swap parameter

