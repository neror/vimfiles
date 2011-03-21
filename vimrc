"Pathogen startup
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax enable
set nocompatible
set showcmd
set ruler
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set foldmethod=syntax
set incsearch
set showmatch
set autoindent
set laststatus=2
set linebreak
set scrolloff=1
set showmode
set showmatch
"syn sync minlines=1000
set paste
let g:netrw_liststyle=3

"set statusline=%{fugitive#statusline()}
set statusline=%<%f\ %y%m%r%w%=%-14.(%l,%c%V%)\ %P

"map Q to reflow paragraph
nnoremap Q gqap
"and to relfow a selected block in visual mode
vnoremap Q gq

"Taglist plugin
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
nmap <Leader>z :TlistToggle<CR>

"Set author name for snipMate
let g:snips_author = 'Nathan Eror'

"autocmd BufWinLeave *.rst mkview
autocmd BufWinEnter *.rst Vst fold
autocmd BufWinEnter *.rst set foldlevel=1
autocmd BufRead,BufNewFile *.rst set textwidth=140

"tell vim about pml files
autocmd BufRead,BufNewFile *.pml set spell
autocmd BufRead,BufNewFile *.pml set filetype=pml
autocmd BufRead,BufNewFile *.pml set number
autocmd BufRead,BufNewFile *.pml set textwidth=140

"tell vim about taskpaper files
autocmd BufRead,BufNewFile *.pml set spell
autocmd BufRead,BufNewFile *.pml set nonumber
autocmd BufRead,BufNewFile *.pml set tabstop=2
autocmd BufRead,BufNewFile *.pml set noexpandtab


let g:xml_syntax_folding = 1
"let xml_jump_string = "Ç"

helptags ~/.vim/doc/
