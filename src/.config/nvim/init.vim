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
Plug 'lambdalisue/suda.vim'
Plug 'lambdalisue/pastefix.vim'
Plug 'dstein64/vim-startuptime'

" Trees
Plug 'simnalamburt/vim-mundo'
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'


" Productivity
Plug 'tricktux/pomodoro.vim'
Plug 'itchyny/calendar.vim'

" UI
" Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

if has('nvim-0.5')
  Plug 'hoob3rt/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
else
  Plug 'itchyny/lightline.vim'
endif


Plug 'liuchengxu/vim-which-key'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'p00f/nvim-ts-rainbow'
"Plug 'roman/golden-ratio'
Plug 'mhinz/vim-startify'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

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
"  Sets {{{
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
set cursorline

set updatetime=200
set timeoutlen=500
set noshowmode
" }}}

" Remaps {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
" }}}
"}}}

" User Iterface
" Colors {{{
set termguicolors
let g:nord_contrast = 1
let g:nord_borders = 0
let g:nord_disable_background = 0
let g:nord_cursorline_transparent = 1
colorscheme nord
" lua require('nord').set()
" }}}
" Statuslines/Tablines {{{
set laststatus=2 " Recommended Settings
" functions {{{
function! PomodoroStatus() abort "{{{
  if pomo#remaining_time() ==# '0'
    return " PoDea"
  else
    return " ".pomo#remaining_time()
  endif
endfunction "}}}
" }}}

" Lightline {{{
let g:lightline = {}
let g:lightline.colorscheme = 'nord'
let g:lightline.active = {
        \   'left': [ [ 'winnr', 'mode', 'paste'],
        \             [ 'readonly', 'relativepath', 'gitbranch', 'modified'] ],
        \   'right': [[ 'lineinfo' ],
        \             [ 'percent' , 'pomodoro'],
        \             [ 'fileformat', 'fileencoding', 'filetype_icon', 'filetype'] ]
        \
        \ }

let g:lightline.inactive = {
        \   'left': [ [ 'winnr','mode', 'paste'],
        \             [ 'readonly', 'fullpath', 'modified'] ],
        \   'right': [[ 'percent', 'fileformat' ],
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
let g:lightline.tabline_separator = { 'left': "", 'right': "" }
let g:lightline.tabline_subseparator = { 'left': ")", 'right': "(" }

let g:lightline.separator = { 'left': "", 'right': "" }
let g:lightline.subseparator = { 'left': ")", 'right': "(" }

" }}}

" lualine.nvim {{{
lua << EOL
config = {
  
  options = {
    theme = 'nord',
    section_separators = {'', ''},
    component_separators = {'', ''}
    },
  
  sections = {
      lualine_a = {'winnr','mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress', 'PomodoroStatus'},
      lualine_z = {'location'}
    },
 
  inactive_sections = {
    lualine_a = {'winnr'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
    },

  extensions = {nerdtree}
  }


lualine = require('lualine').setup(config)
EOL
" }}}
" }}}
" NVIM-Colorizer {{{
lua require'colorizer'.setup()
" }}}
" vim-which-key {{{
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_use_floating_win = 1
let g:which_key_map = {
      \ 'name': 'Alpha',
      \}

let g:which_key_map["\<space>"] = {'name': 'Beta'}
let g:which_key_map.e = {'name': '+edit'}
let g:which_key_map.s = {'name': '+source'}
" }}}
" vim-startify {{{
" vim_header {{{

let g:vim_header = [
      \" ▄▄▄· ▐▄• ▄       ▄▄▌        ▄▄▄▄▄▪   ▄▄·    ▌ ▐·▪  • ▌ ▄ ·.",
      \"▐█ ▀█  █▌█▌▪ ▄█▀▄ ██•   ▄█▀▄ •██  ██ ▐█ ▌▪  ▪█·█▌██ ·██ ▐███▪",
      \"▄█▀▀█  ·██· ▐█▌.▐▌██ ▪ ▐█▌.▐▌ ▐█.▪▐█·██ ▄▄  ▐█▐█•▐█·▐█ ▌▐▌▐█·",
      \"▐█▪ ▐▌▪▐█·█▌▐█▌.▐▌▐█▌ ▄▐█▌.▐▌ ▐█▌·▐█▌▐███▌   ███ ▐█▌██ ██▌▐█▌",
      \" ▀  ▀ •▀▀ ▀▀ ▀█▄▀▪.▀▀▀  ▀█▄▀▪ ▀▀▀ ▀▀▀·▀▀▀   . ▀  ▀▀▀▀▀  █▪▀▀▀"
      \]

" }}}
let g:startify_shoutout=["","","made with \uf004  on \ue712  by @ExtinctAxolotl"]

let g:startify_custom_header = 
      \ startify#center( startify#pad(g:vim_header)) + startify#center(startify#pad(g:startify_shoutout))

" }}}
" Treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  rainbow = {
      enable = true,
    }
}
EOF

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
      \ 'coc-vimlsp',
      \ 'coc-lua',
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

" totally not copy and pasted from sainnhe's dotfiles (https://github.com/sainnhe/dotfiles)
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
" end totally not copy and pasted

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
let g:which_key_map["c"] = { 'name': '+commenting',
      \ "\<space>": "Toggle Line Commenting",
      \ "$": "Comment to EOL",
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
" suda.vim {{{
let g:suda_smart_edit=1
" }}}

" Other
" VIMRC {{{
nnoremap <silent><leader>ev <C-u>:vsp ~/.config/nvim/init.vim <CR>
let g:which_key_map["e"]["v"] = 'VimRC'
" }}}

"vim:foldmethod=marker
