call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'andweeb/presence.nvim'

call plug#end()

let g:presence_log_level = "debug"


" inoremap <expr> <Return> pumvisible() ? "\<C-y>" : "\<Return>"

" Select completion with return
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" Cycle with tab and shift+tab
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

set nocompatible
set nu
set nowrap
" linux kernel standard tab size
set shiftwidth=8
set tabstop=8 softtabstop=8
set relativenumber
set smartindent
set colorcolumn=81  " lines should not be longer than 80 chars
set expandtab

colorscheme darkblue
highlight Normal guibg=none

" Strip trailing whitespace.
function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

" Strip trailing whitespace on write.
autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre *
  \ :call <SID>StripTrailingWhitespaces()

let mapleader = " "

" vertical and horizontal window splitting
nnoremap <leader>V :vsplit<CR>
nnoremap <leader>H :split<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>tn :tabnew<CR>


