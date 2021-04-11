"" vim:foldmethod=marker

"░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
"░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
"░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀

" FILE: ~/.config/nvim/init.vim

": Plugins {{{

call plug#begin(stdpath('data') . '/plugged')

Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdtree'
Plug 'sainnhe/everforest'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'justinmk/vim-sneak'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tricktux/pomodoro.vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'arcticicestudio/nord-vim'
Plug 'Raimondi/delimitMate'
Plug 'roman/golden-ratio'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plugins that were disabled
"Plug 'sainnhe/edge'
"Plug 'itchyny/vim-cursorword'
"Plug 'Yggdroot/indentLine'
"Plug 'tpope/vim-endwise'
"Plug 'ycm-core/YouCompleteMe'

call plug#end()

": Plugins End }}}

" Editor Options {{{
syntax enable

set exrc
set ruler
set nu
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nowrap
set relativenumber
set smartcase
set ignorecase
set incsearch
set undodir=~/.local/share/nvim/undo
set undofile
set scrolloff=8
set signcolumn=yes

" Tabs
set tabstop=2                   
set expandtab                  
set softtabstop=2             
set shiftwidth=2             

if has('termguicolors')
	set termguicolors
endif

" Rust
filetype plugin indent on

" Setting the colorscheme
colorscheme everforest "nord

" set transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Setting the mapleader
let mapleader = " "
" }}}

" Neovide {{{
" }}}

" Plugin Options {{{
": Configuring colorschemes

"" Edge scheme
let g:edge_style = 'neon'
let g:enable_italic = 1

"" Everforest theme
let g:everforest_background = 'hard'

" syntax and autocompletion
"" deoplete
let g:deoplete#enable_at_startup = 1
"" Deoplete - Tab completion
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" UI
"" Lightline  {{{

let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" }}}

"" Nerdtree 
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

    " Opening nerdtree on startup
let NERDTreeWinSize = 35

" Syntastic recommended defaults by official devs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-markdown
" disable header folding
" let g:vim_markdown_folding_disabled = 1

" Goyo and Limelight.vim
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Variables End }}}

" Remaps {{{
"" WinCmd
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>


"" Tabs
nnoremap <leader>th :tabNext <CR>
nnoremap <leader>tl :tabnext <CR>

" Trees 
"" Undo Tree
nnoremap <leader>tu :UndotreeToggle <CR>
nnoremap <leader>tuf :UndotreeFocus <CR>
"" NerdTree
nnoremap <leader>tn :NERDTreeToggle <CR>
""

vnoremap <leader>y "+y <CR>
vnoremap <leader>p "+p <CR>

"" Goyo.vim
nnoremap <leader>G :Goyo  <CR>


" Remaps End }}}
