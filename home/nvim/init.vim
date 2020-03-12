syntax		on
filetype	on
filetype	plugin on
filetype	indent on
colorscheme	zellner

set showcmd
set wildmenu
set cindent
set hlsearch
set backspace+=start,eol,indent
let c_space_errors=1


highlight	WhitespaceEOL ctermbg=red guibg=red
match		WhitespaceEOL /\s\+$/

inoremap <Nul> <C-x><C-o>
map <F1> ^iSigned-off-by: Oliver Pinter <oliver.pntr@gmail.com><CR><ESC>^
map! <F1> Signed-off-by: Oliver Pinter <oliver.pntr@gmail.com><CR>
map <F2> ^iMFC-to: <ESC>^
map! <F2> MFC-to: 
map <F3> ^igithub-issue: <ESC>^
map! <F3> github-issue: 
map <F4> ^iX-MFC-with: <ESC>^
map! <F4> X-MFC-with: 
"map <F5> :!exctags -f "`git rev-parse --show-toplevel`/.tags" -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=".git" "`git rev-parse --show-toplevel`"<CR>
map <F10> :execute "lprev" <CR>
map <F11> :execute "lvimgrep /" . expand("<cword>") . "/j **" <Bar> lopen<CR>
map <F12> :execute "lnext"<CR>

let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/echodoc' " DO NOT ENABLE THIS - conflicts with CompleteParameter
Plug 'Shougo/neoinclude.vim'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'luochen1990/rainbow'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Deoplete settings
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "<c-n>" : "\<tab>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = system("mdfind -name libclang.dylib | grep CommandLineTools | tr -d '\n'")
let g:deoplete#sources#clang#clang_header = system("xcrun --show-sdk-path | tr -d '\n'") . "/usr/include"
let g:deoplete#sources#clang#flags = ["-cc1", "-triple", "x86_64-apple-darwin19.3.0", "-isysroot", system("xcrun --show-sdk-path | tr -d '\n'"), "-fmax-type-align=16"]

" Echodoc settings
let g:echodoc#enable_at_startup = 0
let g:echodoc#type = "floating"

" Rainbow settings
let g:rainbow_active = 1

" auto-pairs hack to allow to use CompleteParameter
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

" CompleteParameter
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
nmap <Tab> <Plug>(complete_parameter#goto_next_parameter)
"imap <Tab> <Plug>(complete_parameter#goto_next_parameter) " DO NOT ENABLE THIS
smap <Tab> <Plug>(complete_parameter#goto_next_parameter)
nmap <S-Tab> <Plug>(complete_parameter#goto_previous_parameter)
"imap <S-Tab> <Plug>(complete_parameter#goto_previous_parameter) " DO NOT ENABLE THIS
smap <S-Tab> <Plug>(complete_parameter#goto_previous_parameter)
nmap <m-d> <Plug>(complete_parameter#overload_down)
imap <m-d> <Plug>(complete_parameter#overload_down)
smap <m-d> <Plug>(complete_parameter#overload_down)
nmap <m-u> <Plug>(complete_parameter#overload_up)
imap <m-u> <Plug>(complete_parameter#overload_up)
smap <m-u> <Plug>(complete_parameter#overload_up)
