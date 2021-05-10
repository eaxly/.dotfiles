"" vim:foldmethod=marker

"░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
"░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
"░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀

" FILE: ~/.config/nvim/init.vim

": Plugins {{{

call plug#begin(stdpath('data') . '/plugged')

Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdtree'
Plug 'sainnhe/everforest'
Plug 'sainnhe/edge'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'justinmk/vim-sneak'
Plug 'tricktux/pomodoro.vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'arcticicestudio/nord-vim'
Plug 'Raimondi/delimitMate'
Plug 'roman/golden-ratio'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-endwise'

" Plugins that were disabled
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'itchyny/vim-cursorword'
"Plug 'Yggdroot/indentLine'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
set scrolloff=5
set signcolumn=yes

" Tabs
set tabstop=2
set shiftwidth=2

if has('termguicolors')
  set termguicolors
endif

" Rust
filetype plugin indent on

" Setting the colorscheme in Plugin options!

" set transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Setting the mapleader
let mapleader = " "
" }}}

" Plugin Options {{{
": Configuring colorschemes

"" Edge scheme
"let g:edge_style = 'aura'
let g:enable_italic = 1
let g:edge_diagnostic_line_highlight = 1
let g:edge_diagnostic_text_highlight = 1
let g:edge_better_performance = 1

"" Everforest theme
let g:everforest_background = 'hard'

" Setting the colorscheme
colorscheme edge "nord

" COC {{{
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
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

" Coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" COC }}}

" UI
"" Lightline  {{{

let g:lightline = {
      \ 'colorscheme': 'edge',
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
nnoremap <leader>p "+p <CR>

"" Goyo.vim
nnoremap <leader>G :Goyo  <CR>


" Remaps End }}}
