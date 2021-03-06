syntax		on
filetype	on
filetype plugin on
filetype indent on
colorscheme	koehler
let		c_space_errors=1
highlight	WhitespaceEOL ctermbg=red guibg=red
match		WhitespaceEOL /\s\+$/
set		cindent
set		hlsearch
set		backspace+=start,eol,indent
"tab-ok es space-ek kiemelese"
""set list listchars=tab:>-,trail:.,extends:>""
"set		list listchars=tab:�\ ,extends:>

set		tags+=$HOME/.vim/tags/current.ctags
"set		tags+=$HOME/.vim/tags/cryptopp.ctags
set		tags+=$HOME/.vim/tags/system.ctags
"set		tags+=$HOME/.vim/tags/glib.ctags
"set		tags+=$HOME/.vim/tags/gl.ctags

map <F1> ^iSigned-off-by: Oliver Pinter <oliver.pinter@hardenedbsd.org><CR><ESC>^
map! <F1> Signed-off-by: Oliver Pinter <oliver.pinter@hardenedbsd.org><CR>
map <F2> ^iCC: Oliver Pinter <oliver.pntr@gmail.com><CR><ESC>^
map! <F2> CC: Oliver Pinter <oliver.pntr@gmail.com><CR>
map <F3> ^iAcked-by: Oliver Pinter <oliver.pntr@gmail.com><CR><ESC>^
map! <F3> Acked-by: Oliver Pinter <oliver.pntr@gmail.com><CR>
map <F4> ^iTested-by: Oliver Pinter <oliver.pntr@gmail.com><CR><ESC>^
map! <F4> Tested-by: Oliver Pinter <oliver.pntr@gmail.com><CR>
map <F5> ^iSigned-off-by: Oliver Pinter <oliver.pntr@gmail.com><CR><ESC>^
map! <F5> Signed-off-by: Oliver Pinter <oliver.pntr@gmail.com><CR>
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>
"screen es tmux alatt ezek a keykodok kellenek hozza
map <silent>[1;5D <C-T>
map <silent>[1;5C <C-]>
map <F12> :!exctags -f $HOME/.vim/tags/current.ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" omniCppComplete - http://www.vim.org/scripts/script.php?script_id=1520
