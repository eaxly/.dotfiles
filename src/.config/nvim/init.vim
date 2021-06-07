" ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
" ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
" ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀

" FILE: ~/.config/nvim/init.vim

" Some Basics
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
Plug 'mhinz/vim-signify'

" Functionality
Plug 'preservim/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'lambdalisue/vim-manpager'

" Trees
Plug 'simnalamburt/vim-mundo'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Productivity
Plug 'tricktux/pomodoro.vim'
Plug 'itchyny/calendar.vim'
Plug 'liuchengxu/vim-which-key'

" UI
" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'itchyny/lightline.vim'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'

"Plug 'roman/golden-ratio'
Plug 'mhinz/vim-startify'
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
" some basic sets {{{
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
filetype plugin on

set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undodir

set incsearch
set scrolloff=10

set foldmethod=marker
set signcolumn=yes

set updatetime=200
set timeoutlen=500
set noshowmode
" }}}

" Keymaps {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

vnoremap <silent><leader>y "+y <cr>
nnoremap <silent><leader>Y "+Y <cr>
nnoremap <silent><leader>p "+p <cr>
vnoremap <silent><leader>p "+p <cr>
" }}}
"}}}

" User Iterface
" Colors {{{
set termguicolors

colorscheme nord
" }}}
" Lightline {{{
set laststatus=2 " Recommended Settings

" functions {{{
function! PomodoroStatus() abort "{{{
  if pomo#remaining_time() ==# '0'
    return "\ue001 PoDea"
  else
    return "\ue003 ".pomo#remaining_time()
  endif
endfunction "}}}
" }}}

let g:lightline = {}
let g:lightline.colorscheme = 'nord'
let g:lightline.active = {
      \   'left': [ [ 'winnr', 'mode', 'paste'],
      \             [ 'readonly', 'relativepath', 'gitbranch', 'modified'] ],
      \   'right': [[ 'lineinfo%<' ],
      \             [ 'percent' , 'pomodoro'],
      \             [ 'fileformat', 'fileencoding', 'filetype_icon', 'filetype'] ]
      \
      \ }
let g:lightline.inactive = {
      \   'left': [ [ 'winnr','mode', 'paste'],
      \             [ 'readonly', 'fullpath', 'modified'] ],
      \   'right': [[ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype_icon', 'filetype' ] ]
      \
      \ }

let g:lightline.tab = {
      \   'active': [ 'tabnum', 'filename', 'modified'],
      \   'inactive': [ 'tabnum', 'filename', 'modified'],
      \ }

let g:lightline.component_function = {
      \   'gitbranch': 'FugitiveHead',
      \   'filetype_icon': 'WebDevIconsGetFileTypeSymbol',
      \   'pomodoro': 'PomodoroStatus',
      \ }

let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }

let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }


" }}}
" NVIM-Colorizer {{{
lua require'colorizer'.setup()
" }}}
" vim-which-key {{{
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

 " TODO: Update these keybindings
let g:which_key_use_floating_win = 1
let g:which_key_map = {
      \ 'name': 'Alpha',
      \ 'p': 'Paste',
      \ 'Y': 'Yank line',
      \}

let g:which_key_map["\<space>"] = {'name': 'Beta'}
let g:which_key_map["e"] = {'name': 'Edit'}
let g:which_key_map["s"] = {'name': 'Source'}
" }}}

"Productivity
" Mundo {{{
let g:mundo_right=1
nnoremap <leader>u :MundoToggle <CR>
let g:which_key_map["u"] = 'undotree'
" }}}
" CoC.nvim {{{
" coc-extensions {{{
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-sh',
      \ 'coc-pyright',
      \ 'coc-vimlsp'
      \ ]
" }}}

" Shortcuts that were totally not copy and pasted {{{
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
" }}}
" Pomodoro.vim {{{

let g:Pomodoro_Status = 0
function! Toggle_Pomodoro()
  if g:Pomodoro_Status == 0
    let g:Pomodoro_Status = 1
    execute 'PomodoroStart'
  elseif g:Pomodoro_Status == 1
    let g:Pomodoro_Status = 0
    execute 'PomodoroStop'
  endif
endfunction

let g:pomodoro_time_work = 25
let g:pomodoro_time_slack = 5 

let g:pomodoro_do_log = 1 
let g:pomodoro_log_file = "/tmp/pomodoro.log" 

let g:pomodoro_notification_cmd = "notify-send --icon=neovim 'Pomodoro Timer' 'Your time is up!' --urgency=critical"

nnoremap <silent> <leader>P :<c-u>call Toggle_Pomodoro()<cr>
let g:which_key_map["P"] = 'Toggle Pomodoro'

" }}}
" NERDCommenter {{{
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" WhichKeys
let g:which_key_map["c"] = { 'name': 'Commenting',
      \ "\<space>": "Toggle Line Commenting",
      \ "$": "Comment to EOL (WARN: Doesn't work, waste of time)",
      \ "a": "Comment while respecting Alternative Delimiters",
      \ "A": "Append Comment",
      \ "c": "Comment (no toggling)",
      \ "i": "Invert Comment",
      \ "l": "Align Left",
      \ "m": "Minimal Comment",
      \ "n": "Nested Comment",
      \ "s": "S e x y Comment",
      \ "u": "Uncomment Comment",
      \ "y": "Yank, then Comment",
      \}

" }}}
" NERDTree {{{

nnoremap <silent><leader>f :<c-u>NERDTreeToggle <cr>
let g:which_key_map["f"] = 'Toggle File Explorer'
" }}}

" VIMRC {{{
nnoremap <silent><leader>ev <C-u>:vsp ~/.config/nvim/init.vim <CR>
let g:which_key_map["e"]["v"] = 'VimRC'
nnoremap <silent><leader>sv <C-u>:source ~/.config/nvim/init.vim <bar> :doautocmd BufRead <CR>
let g:which_key_map["s"]["v"] = "VimRC"
" }}}
