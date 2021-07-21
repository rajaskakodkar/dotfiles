set nocompatible
set et
set ai
set sw=2
set ts=2
set ruler
set si
set nu
set is
set ic
set sm
set sta
syn on
set backspace=indent,eol,start
set hlsearch
set nobackup
set nowritebackup
set wildmenu
set incsearch
set background=dark
set textwidth=79
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

hi LineTooLong cterm=bold ctermbg=red guibg=LightYellow

au FileType make set noet

set pastetoggle=<F3>

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

" Disable valadoc syntax highlight
" "let vala_ignore_valadoc = 1
"
" " Enable comment strings
let vala_comment_strings = 1
"
" " Highlight space errors
let vala_space_errors = 1
" " Disable trailing space errors
" "let vala_no_trail_space_error = 1
" " Disable space-tab-space errors
" let vala_no_tab_space_error = 1
"
" " Minimum lines used for comment syncing (default 50)
" "let vala_minlines = 120

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 

" Configuration for indentation plugin of golang
filetype indent on


" Tabs and indentation
set expandtab                     " Use spaces instead if tabs
set autoindent                    " Auto indent
set smartindent                   " Smart indent
set shiftwidth=2                  " Maintain 2 level indentation
set tabstop=2                     " 2 level indentation for Tab
set wrap linebreak textwidth=0    " Wrap lines

execute pathogen#infect()
syntax on
filetype plugin indent on
let g:vim_markdown_folding_disabled = 1
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" start with nerdtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
