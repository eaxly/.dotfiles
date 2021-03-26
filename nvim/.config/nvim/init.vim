" vim:foldmethod=marker

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
"Plug 'deoplete-plugins/deoplete-jedi'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'

" Plugins that were disabled
" Disabled because folds were going crazy in markdown
"Plug 'plasticboy/vim-markdown'
" Not used anymore
"Plug 'sainnhe/edge'

" Apparently struggles with deoplete
"Plug 'tpope/vim-endwise'
"Plug 'ycm-core/YouCompleteMe'
call plug#end()

": Plugins End }}}

" Editor Options {{{
syntax on

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
set tabstop=8                   
set expandtab                  
set softtabstop=2             
set shiftwidth=2             

if has('termguicolors')
	set termguicolors
endif

" Setting the colorscheme
colorscheme everforest

let mapleader = " "
" }}}

" Plugin Options {{{
": Configuring colorschemes

"" Edge scheme
let g:edge_style = 'neon'
let g:enable_italic = 1

"" Everforest theme
let g:everforest_background = 'medium'

" syntax and autocompletion
"" deoplete
let g:deoplete#enable_at_startup = 1

" UI
"" Lightline 
let g:lightline = { 'colorscheme': 'everforest' }

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
" Remaps End }}}
