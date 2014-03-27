"Powerline http://powerline.readthedocs.org/
set rtp+=/Users/neror/Work/powerline/powerline/bindings/vim

"Exit insert mode immediately when pressing ESC
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set nocompatible
filetype plugin indent on
runtime bundle/vim-pathogen/autoload/pathogen.vim

set history=2000
set backupcopy=yes
set showcmd
set ruler
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=0
set expandtab
set smartindent
set foldmethod=syntax
set incsearch
set showmatch
set autoindent
set laststatus=2
set linebreak
set scrolloff=1
set noshowmode
set showmatch
set number
set splitright
set list
"let &showbreak = '... '
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
nnoremap Q gqip
nnoremap W vipJ
"and to relfow a selected block in visual mode
vnoremap Q gq

"Make the spacebar do something useful in normal mode
nnoremap <Space> viw

"<f4> to index tags with ctags
nnoremap <f4> :!ctags -R<CR>

"HJKL use virtual lines
nnoremap j gj
nnoremap k gk

"Clear the search pattern
set nohlsearch
nnoremap <Leader>sh :set hlsearch!<CR>
nnoremap <Leader>ss :let @/ = ""<CR>

"Taglist plugin
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
nnoremap <Leader>z :TlistToggle<CR>

"NERDTree plugin
nnoremap <Leader>n :NERDTreeToggle<CR>

"CtrlP custom settings
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'a'

if has("mac")
	augroup filetype_markdown_on_mac
		autocmd!

		"For Marked.app MultiMarkdown preview
		autocmd FileType markdown nnoremap <buffer> <leader>m :silent !open -a Marked.app '%:p'<cr>

		"MultiMarkdown utlility mappings
		autocmd FileType markdown vnoremap <buffer> K !~/Library/Application\ Support/MultiMarkdown/Utilities/table_cleanup.pl<cr>

		"formd Markdown shortcuts
		autocmd FileType markdown nmap <buffer> <leader>fr :%! formd -r<CR>
		autocmd FileType markdown nmap <buffer> <leader>fi :%! formd -i<CR>

    "Turn off list setting to make text wrap at word boundaries
		autocmd FileType markdown :set nolist
	augroup END

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
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme = 'skwp'

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
autocmd BufEnter * let &titlestring = expand("%:t")
if &term == "xterm-256color"
	set t_ts=]1;
	set t_fs=
endif
if &term == "screen" || &term == "xterm" || &term == "xterm-256color"
  set title
endif

"Omnisharp config
let g:Omnisharp_start_server = 1
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

"Super tab settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests. 
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

"nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
" Builds can run asynchronously with vim-dispatch installed
nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>

"The following commands are contextual, based on the current cursor position.

nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>
"show type information automatically when the cursor stops moving
"autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"set updatetime=500
"set cmdheight=2
"I find contextual code actions so useful that I have it mapped to the spacebar
"nnoremap <space> :OmniSharpGetCodeActions<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>
" Automatically add new cs files to the nearest project on save
autocmd BufWritePost *.cs call OmniSharp#AddToProject()
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>

" END Omnisharp config
