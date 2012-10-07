syntax enable
set backupcopy=yes
set nocompatible
set showcmd
set ruler
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=140
set noexpandtab
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
set number
set background=light
set splitright
let &showbreak = '... '
"syn sync minlines=1000
set paste
let g:netrw_liststyle=3

"Get python site-packages on the sys.path
py import sys
py sys.path.append('/Library/Python/2.7/site-packages')

"Pathogen startup
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"set statusline=%{fugitive#statusline()}
set statusline=%<%f\ %y%m%r%w%=%-14.(%l,%c%V%)\ %P

"map Q to reflow paragraph
nnoremap Q gqap
"and to relfow a selected block in visual mode
vnoremap Q gq

"Clear the search pattern
nnoremap <Leader>s :let @/ = ""<CR>

"Taglist plugin
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
nmap <Leader>z :TlistToggle<CR>

"NERDTree plugin
nmap <Leader>n :NERDTreeToggle<CR>

if has("mac")
  "For Marked.app MultiMarkdown preview
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
  
  "MultiMarkdown utlility mappings
  vmap K !~/Library/Application\ Support/MultiMarkdown/Utilities/table_cleanup.pl<cr>
  if exists("*togglebg")
    "Map light/dark background toggle for Solarized
    call togglebg#map("<F5>")
  endif
endif

"Set author name for snipMate
let g:snips_author = 'Nathan Eror'

"autocmd BufWinLeave *.rst mkview
"autocmd BufWinEnter *.rst Vst fold
"autocmd BufWinEnter *.rst set foldlevel=1
autocmd BufRead,BufNewFile *.rst set textwidth=140

"tell vim about pml files
autocmd BufRead,BufNewFile *.pml set spell
autocmd BufRead,BufNewFile *.pml set filetype=pml
autocmd BufRead,BufNewFile *.pml set nonumber
autocmd BufRead,BufNewFile *.pml set textwidth=140
autocmd	BufRead,BufNewFile *.pml map <Leader>b :!./rake clean no-workflow %<.pdf;open %<.pdf<CR> 

"tell vim about jinja files
autocmd BufRead,BufNewFile *.j2 set filetype=htmljinja

"Unity C# compiler pligin
autocmd BufRead,BufNewFile *.cs compiler unitycs

let g:xml_syntax_folding = 1
"let xml_jump_string = "Ç"

"tslime keymaps
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"Powerline
let g:Powerline_symbols = 'fancy'

helptags ~/.vim/doc/

