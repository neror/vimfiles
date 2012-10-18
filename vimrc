set nocompatible
filetype plugin indent on
runtime bundle/vim-pathogen/autoload/pathogen.vim

set backupcopy=yes
set showcmd
set ruler
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
set splitright
let &showbreak = '... '
"syn sync minlines=1000
set paste
let g:netrw_liststyle=3

"Get python site-packages on the sys.path
py import sys
py sys.path.append('/Library/Python/2.7/site-packages')

"Pathogen startup
call pathogen#infect()

"set statusline=%{fugitive#statusline()}
"set statusline=%<%f\ %y%m%r%w%=%-14.(%l,%c%V%)\ %P

"map Q to reflow paragraph
nnoremap Q gqap
"and to relfow a selected block in visual mode
vnoremap Q gq

"Make the spacebar do something useful in normal mode
nnoremap <Space> viw

"Clear the search pattern
set nohlsearch
nnoremap <Leader>sh :set hlsearch!<CR>
nnoremap <Leader>ss :let @/ = ""<CR>

"Taglist plugin
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
nnoremap <Leader>z :TlistToggle<CR>

"NERDTree plugin
nnoremap <Leader>n :NERDTreeToggle<CR>

if has("mac")
  "For Marked.app MultiMarkdown preview
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
  
  "MultiMarkdown utlility mappings
  vnoremap K !~/Library/Application\ Support/MultiMarkdown/Utilities/table_cleanup.pl<cr>
  if exists("*togglebg")
    "Map light/dark background toggle for Solarized
    call togglebg#map("<F5>")
  endif
endif

"Set author name for snipMate
let g:snips_author = 'Nathan Eror'

augroup filetype_rst
	autocmd!
	"autocmd BufWinLeave *.rst mkview
	"autocmd BufWinEnter *.rst Vst fold
	"autocmd BufWinEnter *.rst set foldlevel=1
	autocmd BufRead,BufNewFile *.rst set textwidth=140
augroup END

"tell vim about pml files
augroup filetype_pml
	autocmd!
	autocmd BufRead,BufNewFile *.pml set spell
	autocmd BufRead,BufNewFile *.pml set filetype=pml
	autocmd BufRead,BufNewFile *.pml set nonumber
	autocmd BufRead,BufNewFile *.pml set textwidth=140
	autocmd	BufRead,BufNewFile *.pml noremap <LocalLeader>b :!./rake clean no-workflow %<.pdf;open %<.pdf<CR> 
augroup END

"tell vim about jinja files
augroup filetype_htmljinja
	autocmd!
	autocmd BufRead,BufNewFile *.j2 set filetype=htmljinja
augroup END

"Unity C# compiler plugin
augroup filetype_unitycs
	autocmd!
	autocmd BufRead,BufNewFile *.cs compiler unitycs
augroup END

let g:xml_syntax_folding = 1
"let xml_jump_string = "Ç"

"tslime keymaps
vnoremap <C-c><C-c> <Plug>SendSelectionToTmux
nnoremap <C-c><C-c> <Plug>NormalModeSendToTmux
nnoremap <C-c>r <Plug>SetTmuxVars

"Powerline
let g:Powerline_symbols = 'fancy'

"Quick 'macro' mappings
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

"clang_complete
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'

let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="low"    "default value is normal
let g:solarized_hitrail=1    "default value is 0
syntax enable
set background=dark
colorscheme solarized

"Force myself to use hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Set iTerm2 tab to filename in vim
if &term == "screen"
	set t_ts=^[]1;
	set t_fs=^G
endif
if &term == "screen" || &term == "xterm"
  set title
endif
