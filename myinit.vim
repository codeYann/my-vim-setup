" Install All Plugins that i need
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'crusoexia/vim-dracula'
Plug 'morhetz/gruvbox'
call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()

syntax enable

" Theme area
colorscheme dracula
set background=dark

" Initial settings
set guifont=JetBrains\ Mono\ Medium\ Nerd\ Font\ Complete\ Mono.ttf:h12
set encoding=utf8
set softtabstop=4
set completeopt=noinsert,menuone,noselect
set hidden
set number
set mouse=a
set inccommand=split

" Put a ';' in the end of line
let mapleader="\<space>"
nnoremap <leader>; A;<esc>

" CTRL + p => Tree of files 
nnoremap <C-p> :NERDTreeToggle <cr>
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CTRL + s => Save
nnoremap <C-s> :w! <cr>
" CTRL + z => undo
nnoremap <C-z> :u <cr>

" Emmet for css and html
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Python checkhealth
let g:python3_host_prog="/usr/bin/python3"
" Rainbow in brackets
let g:rainbow_active = 1

" Theme of low bar
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
\ }

" NERDcommenter 
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map cc <Plug>NERDCommenterInvert

" Shortcutting split navegation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Split screen
nnoremap <C-a> :sp<cr>
nnoremap <C-q> :vsp<cr>

"Git Gutter settings
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
autocmd VimEnter * GitGutterLineNrHighlightsEnable

source ~/.config/nvim/coc/coc.nvimrc   

