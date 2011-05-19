"For Macvim
set guifont=Menlo\ Regular:h13
set guioptions=egmt
set lines=66
set columns=209
set number
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set background=dark
let g:solarized_style="dark" 
"let g:solarized_contrast="high"

"colorscheme slate2
colorscheme solarized

"function! ToggleBackground()
"  if (g:solarized_style=="dark")
"  let g:solarized_style="light"
"  colorscheme solarized
"else
"  let g:solarized_style="dark"
"  colorscheme solarized
"endif
"endfunction
"command! Togbg call ToggleBackground()
"nnoremap <F5> :call ToggleBackground()<CR>
"inoremap <F5> <ESC>:call ToggleBackground()<CR>a
"vnoremap <F5> <ESC>:call ToggleBackground()<CR>

