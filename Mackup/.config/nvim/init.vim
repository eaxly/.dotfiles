"" vim:foldmethod=marker

"░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
"░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
"░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀

" FILE: ~/.config/nvim/init.vim

" Basic Checks {{{
if empty(globpath(&runtimepath, '/autoload/plug.vim'))
  echoerr 'Unable to find autoload/plug.vim. Download it from https://github.com/junegunn/vim-plug'
  finish
endif

if exists('g:vim_man_pager')
  let g:vim_enable_startify = 0
else
  let g:vim_enable_startify = 1
endif

set noshowmode
" }}}

": Plugins {{{

call plug#begin(stdpath('data') . '/plugged')

Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdtree'
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/edge'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'justinmk/vim-sneak'
Plug 'tricktux/pomodoro.vim'
Plug 'itchyny/lightline.vim'
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
Plug 'liuchengxu/vim-which-key'
Plug 'simnalamburt/vim-mundo'

if has('nvim-0.5')
  Plug 'hoob3rt/lualine.nvim'
endif

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

" Character Tabs
set tabstop=2 shiftwidth=2 expandtab

if has('termguicolors')
  set termguicolors
endif

" Rust
filetype plugin indent on

" Setting the colorscheme in Plugin options!

" set transparent background
"hi Normal guibg=NONE ctermbg=NONE

" Setting the mapleader
let mapleader = " "

" timeoutlen
set timeoutlen=600
" }}}

" Plugin Options {{{
": Configuring colorschemes

"" Edge scheme
let g:edge_style = 'aura'
let g:enable_italic = 1
let g:edge_diagnostic_line_highlight = 1
let g:edge_diagnostic_text_highlight = 1
let g:edge_better_performance = 1

"" Everforest theme
let g:everforest_background = 'hard'

" Setting the colorscheme
colorscheme nord

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

" F2 Rename (totally not copy and pasted from https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f#file-init-vim-L163)
nmap <F2> <Plug>(coc-rename)
" COC }}}
" UI
"" Lightline  {{{

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let laststatus=2
if !has('gui_running')
  set t_Co=256
endif
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

" Vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" COC-Explorer
nmap <leader>e :CocCommand explorer<CR>

" Plugin Options End }}}

" Remaps {{{
"" WinCmd
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>


"" Tabs
nnoremap <leader>Th :tabNext <CR>
nnoremap <leader>Tl :tabnext <CR>
nnoremap <leader>Tn :tabnew <CR>
nnoremap <leader>Tc :tabclose <CR>

" Trees 
"" Undo Tree
"nnoremap <leader>tu :UndotreeToggle <CR>
"nnoremap <leader>tuf :UndotreeFocus <CR>
"" NerdTree
nnoremap <leader>tn :NERDTreeToggle <CR>
""

" Copy N Paste
vnoremap <leader>y "+y <CR>
nnoremap <leader>p "+p <CR>

"" Goyo.vim
nnoremap <leader>G :Goyo  <CR>

" Write and/or Quit
nnoremap <leader>wq :wq <CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>q :q <CR>

" Mundo
nnoremap <leader>m :MundoToggle <CR>
nnoremap <leader>M :MundoShow <CR>
nnoremap <leader>Mq :MundoQuit <CR>

" Remaps End }}}
