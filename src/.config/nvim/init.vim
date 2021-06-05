" ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
" ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
" ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀

" FILE: ~/.config/nvim/init.vim

" Plugins {{{
" Check if plug.vim is installed {{{
if empty(globpath(&runtimepath, '/autoload/plug.vim'))
  echoerr 'Unable to find autoload/plug.vim. Download it from https://github.com/junegunn/vim-plug'
  finish
endif
" }}}

" Plug.vim {{{
call plug#begin(stdpath('data') . '/plugged')
" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Git
Plug 'tpope/vim-fugitive'

" Functionality
Plug 'preservim/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'norcalli/nvim-colorizer.lua'

" Trees
Plug 'simnalamburt/vim-mundo'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" UI
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'

call plug#end()
" }}}

" Install Plugins automatically {{{
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
" }}}
" }}}

" Basics {{{
syntax on
set exrc
set nohlsearch
set noerrorbells
set hidden

" Tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent

" Numbers
set relativenumber number

set nowrap
set ignorecase
set smartcase

set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undodir

set incsearch
set scrolloff=10

set foldmethod=marker
set signcolumn=yes

set updatetime=200
set laststatus=2

let g:mapleader = " "
" }}}

" UI {{{
" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'readonly', 'relativepath', 'gitbranch', 'modified'] ],
      \   'right': [[ 'line', 'column' ],
      \             [ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype'] ]
      \
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'readonly', 'fullpath', 'modified'] ],
      \   'right': [[ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype'] ]
      \
      \ },
      \ 'tab': {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ],
      \ },
      \
      \
      \
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 
      \}
" }}}
set noshowmode

" Colors {{{
if has('termguicolors')
  set termguicolors
endif

colorscheme nord
hi Normal guibg=NONE ctermbg=NONE
" Always set transparent background AFTER initializing the colorscheme  
" }}}
" }}}

" Mundo {{{
nnoremap <leader>m :MundoToggle <CR>
" }}}

" CoC.nvim {{{
" Use tab for trigger completion with characters ahead and navigate. {{{
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}

" Use <c-space> to trigger completion. {{{
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" }}}

" Use K to show docs {{{
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" }}}

" Remap <C-f> and <C-b> for scroll float windows/popups. {{{
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" }}}
" }}}

" VIMRC {{{
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim <CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim <bar> :doautocmd BufRead <CR>
" }}}
