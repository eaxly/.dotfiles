" ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
" ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
" ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
"
" FILE: ~/.config/nvim/init.vim

" Some Basics
" Plugins {{{
" Check if plug.vim is installed {{{
if empty(globpath(&runtimepath, '/autoload/plug.vim'))
  echoerr 'Unable to find autoload/plug.vim. Download it from https://github.com/junegunn/vim-plug'
  finish
endif
" }}}

" Vars {{{
let g:enable_startify=1
let g:enable_dashboard=0
" }}}

" Plug.vim {{{
call plug#begin(stdpath('data') . '/plugged')
" Completion
" if has('nvim-0.5')
"   Plug 'hrsh7th/nvim-compe'
"   Plug 'neovim/nvim-lspconfig'
" endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Git
" Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'

" Functionality
Plug 'preservim/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

Plug 'lambdalisue/vim-manpager'
Plug 'lambdalisue/suda.vim'
Plug 'lambdalisue/pastefix.vim'

Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}
" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}

Plug 'andweeb/presence.nvim'

" Fuzzy finder
if has('nvim-0.5')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif

" Trees
Plug 'simnalamburt/vim-mundo'
" Chad tree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" Productivity
Plug 'tricktux/pomodoro.vim'
Plug 'itchyny/calendar.vim'

" UI
" Plug 'sainnhe/gruvbox-material'
" Plug 'shaunsingh/nord.nvim'
" Plug 'shaunsingh/moonlight.nvim'
Plug 'arcticicestudio/nord-vim'
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'cocopon/iceberg.vim'

Plug 'Pocco81/TrueZen.nvim'
Plug 'junegunn/goyo.vim'

Plug 'hoob3rt/lualine.nvim'
" Plug 'glepnir/galaxyline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'liuchengxu/vim-which-key'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'RRethy/vim-hexokinase'
if g:enable_startify==1
  Plug 'mhinz/vim-startify'
elseif g:enable_dashboard==1
  Plug 'glepnir/dashboard-nvim'
endif

call plug#end()
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
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent autoindent

" Numbers
set relativenumber number

set nowrap

set ignorecase
set smartcase
filetype plugin on

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set noswapfile
set nobackup
set undofile
set undodir=~/.local/share/nvim/undodir

set incsearch
set scrolloff=10

set foldmethod=marker
set cursorline

set updatetime=200
set timeoutlen=500
set noshowmode

set completeopt=menuone,noselect

set shortmess+=c

set mouse=nv
" }}}
" Remaps {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
nnoremap <silent><C-s> :write <cr>
nnoremap <silent><C-q> :BufferClose<cr>
" }}}
"}}}

" User Iterface
" vim-which-key {{{
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_use_floating_win = 1
let g:which_key_map = {
      \ 'name': 'Alpha',
      \}

let g:which_key_map["e"] = {'name': '+edit'}
let g:which_key_map["s"] = {'name': '+source'}

let g:which_key_map["C"] = { 'name': '+clipboard',
      \ 'y': 'Yank to clipboard',
      \ 'p': 'Paste from clipboard',
      \}

nnoremap <silent> <leader>Cp "+p <cr>
vnoremap <silent> <leader>Cy "+y <cr>
" }}}
" neovide {{{
" functions {{{
fu! Neovide_Toggle_Fullscreen()
  if g:neovide == v:true
    if g:neovide_fullscreen == v:true
      let g:neovide_fullscreen=v:false
    else
      let g:neovide_fullscreen=v:true
    endif
  endif
endfu
" }}}
" guifont
set guifont=VictorMono\ Nerd\ Font:h10

let g:neovide_cursor_animation_length=0.15
let g:neovide_cursor_antialiasing=v:false
let g:neovide_cursor_trail_length=0.9
let g:neovide_cursor_vfx_mode = "pixiedust" " On my very personal computer, railgun & torpedo crash neovide. That does not mean that it will crash on yours!! Try it out :D
let g:neovide_cursor_vfx_particle_lifetime=0.9
let g:neovide_cursor_vfx_particle_density=5.0

let g:which_key_map["n"] = {'name': '+neovide',
      \'f': [ ':call Neovide_Toggle_Fullscreen()', 'Toggle neovide fullscreen' ]
      \}
" }}}
" Colors {{{
set termguicolors

" Nord Theme {{{
let g:nord_contrast = v:true
let g:nord_borders = v:true
let g:nord_disable_background = v:false
let g:nord_cursorline_transparent = v:true
" }}}

" Moonlight {{{
let g:moonlight_italic_comments=1
let g:moonlight_italic_keywords=1
let g:moonlight_italic_functions=1
let g:moonlight_italic_variables=1
let g:moonlight_borders=1
" }}}

" Gruvbox Material {{{
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_visual = 'green background'
let g:gruvbox_material_diagnostic_text_highlight = 1
" }}}

" Material Theme {{{
let g:material_theme_style = 'ocean'
let g:material_theme_italics = 1
" }}}

colorscheme nord
" }}}
" Statuslines/Tablines {{{
set laststatus=2 " Recommended Settings
" functions {{{
function! PomodoroStatus() abort " {{{
  if pomo#remaining_time() ==# '0'
    return " PoDea"
  else
    return " ".pomo#remaining_time()
  endif
endfunction }}}
" }}}
" barbar.nvim {{{
" Remaps
let g:which_key_map["a"] = {
      \ 'name': '+tabs/buffers',
      \ ',': [':BufferPrevious', 'Go to Previous Buffer'],
      \ '.': [':BufferNext', 'Go to Next Buffer'],
      \
      \ '1': [':BufferGoto 1', 'Go to buffer 1'],
      \ '2': [':BufferGoto 2', 'Go to buffer 2'],
      \ '3': [':BufferGoto 3', 'Go to buffer 3'],
      \ '4': [':BufferGoto 4', 'Go to buffer 4'],
      \ '5': [':BufferGoto 5', 'Go to buffer 5'],
      \ '6': [':BufferGoto 6', 'Go to buffer 6'],
      \ '7': [':BufferGoto 7', 'Go to buffer 7'],
      \ '8': [':BufferGoto 8', 'Go to buffer 8'],
      \ '9': [':BufferGoto 9', 'Go to buffer 9'],
      \ '0': [':BufferLast', 'Go to last buffer'],
      \
      \ 'c': [':BufferClose', 'Close Buffer'],
      \ 'C': [':BufferClose!', 'Close Buffer'],
      \}

let bufferline = get(g:, 'bufferline', {})
let bufferline.clickable = v:false
let bufferline.closable = v:false
let bufferline.letters =
  \ 'asdfjklöghnmxcvbziowerutyqpASDFJKLÖGHNMXCVBZIOWERUTYQP'
" }}}
" lualine.nvim {{{
lua << EOL
config = {

  options = {
    theme = 'nord',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {'chadtree'}
    },

  sections = {
      lualine_a = {'winnr','mode'},
      lualine_b = {'branch'},
      lualine_c = {
            'filename',
            {'diagnostics',
                sources=coc,
                sections = {'error', 'warn', 'info', 'hint'},
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
            },
            },
      lualine_x = {
          'encoding',
          'fileformat',
          {
            'filetype',
            colored=false
          }
      },
      lualine_y = {'progress', 'PomodoroStatus'},
      lualine_z = {
          'location',
          {
              'diff',
              colored=false
          }
      }
    },

  inactive_sections = {
    lualine_a = {'winnr'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
    },
    extensions = {nerdtree, chadtree}
  }


lualine = require('lualine').setup(config)
EOL
" }}}
" }}}
" NVIM-Colorizer {{{
lua require'colorizer'.setup()
" }}}
" startify/Dashboard{{{
" vim_header {{{

let g:vim_header = [
      \" ▄▄▄· ▐▄• ▄       ▄▄▌        ▄▄▄▄▄▪   ▄▄·    ▌ ▐·▪  • ▌ ▄ ·.",
      \"▐█ ▀█  █▌█▌▪ ▄█▀▄ ██•   ▄█▀▄ •██  ██ ▐█ ▌▪  ▪█·█▌██ ·██ ▐███▪",
      \"▄█▀▀█  ·██· ▐█▌.▐▌██ ▪ ▐█▌.▐▌ ▐█.▪▐█·██ ▄▄  ▐█▐█•▐█·▐█ ▌▐▌▐█·",
      \"▐█▪ ▐▌▪▐█·█▌▐█▌.▐▌▐█▌ ▄▐█▌.▐▌ ▐█▌·▐█▌▐███▌   ███ ▐█▌██ ██▌▐█▌",
      \" ▀  ▀ •▀▀ ▀▀ ▀█▄▀▪.▀▀▀  ▀█▄▀▪ ▀▀▀ ▀▀▀·▀▀▀   . ▀  ▀▀▀▀▀  █▪▀▀▀"
      \]

" }}}
" Startify {{{
if g:enable_startify==1
  let g:startify_shoutout=["","","made with \uf004  on \ue712  by @ExtinctAxolotl"]
  let g:startify_custom_header =
        \ startify#center( startify#pad(g:vim_header)) + startify#center(startify#pad(g:startify_shoutout))

  let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
  let g:startify_files_number=5
  let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, { 'z': '~/.zshrc' }]
  
endif
" }}}
" Dashboard {{{
if g:enable_dashboard==1
    let g:dashboard_default_executive='telescope'

  let g:dashboard_custom_shortcut={
  \ 'find_history'       : 'SPC D h',
  \ 'find_file'          : 'SPC D f',
  \ 'new_file'           : 'SPC D n',
  \ 'change_colorscheme' : 'SPC D c',
  \ 'find_word'          : 'SPC D a',
  \ 'book_marks'         : 'SPC D b',
  \ 'dotfiles'           : 'SPC D d',
  \ }

  let g:which_key_map["D"] = {'name': '+dashboard',
        \ 'h': [':DashboardFindHistory', 'History'],
        \ 'f': [':DashboardFindFile', 'Find a File'],
        \ 'n': [':DashboardNewFile', 'Create a new file'],
        \ 'c': [':DashboardChangeColorscheme', 'Change the colorscheme'],
        \ 'a': [':DashboardFindWord', 'Find a word'],
        \ 'b': [':DashboardJumpMarks', 'Search bookmarks'],
        \ 'd': [':edit ~/.config/nvim/init.vim', 'Edit neovim config file']
        \}

        " 'l': [':SessionLoad', 'Load last session'],
        " 's': [':SessionSave', 'Save current Session'],
    
  let g:dashboard_custom_header =<< trim END
  =================     ===============     ===============   ========  ========
  \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
  ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
  || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
  ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
  || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
  ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
  || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
  ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
  ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
  ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
  ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
  ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
  ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
  ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
  ||.=='    _-'                                                     `' |  /==.||
  =='    _-'                      A X O L O T I C                       \/   `==
  \   _-'                             N V I M                            `-_   /
   `''                                                                      ``'
  END

  let g:dashboard_custom_section={
      \ 'dotfiles': {
        \ 'description': ['  Edit neovim config'],
        \ 'command': ':edit ~/.config/nvim/init.vim',
      \},
    \}

endif

" }}}
" }}}
" LSP {{{
" " LSP Language Servers {{{
" lua << EOF
" require'lspconfig'.pyright.setup{}
" require'lspconfig'.bashls.setup{}
" require'lspconfig'.vimls.setup{}
" require'lspconfig'.rls.setup{}
" EOF
" " }}}
" " Compe {{{
" lua << EOF
" -- Compe setup
" require'compe'.setup {
"   enabled = true;
"   autocomplete = true;
"   debug = false;
"   min_length = 1;
"   preselect = 'enable';
"   throttle_time = 80;
"   source_timeout = 200;
"   incomplete_delay = 400;
"   max_abbr_width = 100;
"   max_kind_width = 100;
"   max_menu_width = 100;
"   documentation = true;
"
"   source = {
"     path = true;
"     nvim_lsp = true;
"   };
" }
"
" local t = function(str)
"   return vim.api.nvim_replace_termcodes(str, true, true, true)
" end
"
" local check_back_space = function()
"     local col = vim.fn.col('.') - 1
"     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
"         return true
"     else
"         return false
"     end
" end
"
" -- Use (s-)tab to:
" --- move to prev/next item in completion menuone
" --- jump to prev/next snippet's placeholder
" _G.tab_complete = function()
"   if vim.fn.pumvisible() == 1 then
"     return t "<C-n>"
"   elseif check_back_space() then
"     return t "<Tab>"
"   else
"     return vim.fn['compe#complete']()
"   end
" end
" _G.s_tab_complete = function()
"   if vim.fn.pumvisible() == 1 then
"     return t "<C-p>"
"   else
"     return t "<S-Tab>"
"   end
" end
"
" vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
" EOF
"
" " }}}
" }}}
" COC.nvim {{{
" extensions {{{
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-rust-analyzer', 'coc-sh', 'coc-lua', 'coc-pyright', 'coc-snippets']
" }}}
" Keybindings {{{
" Use tab for trigger completion with characters ahead and navigate.
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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
" Indent blankline{{{
let g:indent_blankline_use_treesitter = v:true

let g:indent_blankline_filetype_exclude = ['help', 'startify', 'NvimTree', 'calendar', 'man']
" }}}
" Z E N (TrueZen.nvim) {{{
lua << EOF
local true_zen = require("true-zen")
EOF
let g:which_key_map['z'] = {
  \ 'name': '+zen',
  \ 'a': [ ':TZAtaraxis', 'Enable Zen Ataraxis mode' ],
  \ 'm': [ ':TZMinimalist', 'Enable Zen Minimalist mode']
  \}
" }}}

" Productivity
" Mundo {{{
let g:mundo_right=1
let g:which_key_map[ "u" ] = [ ':MundoToggle', 'Toggle UndoTree' ]
" }}}
" Pomodoro.vim {{{

" totally not copy and pasted from sainnhe's dotfiles (https://github.com/sainnhe/dotfiles) {{{
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
" end totally not copy and pasted }}}

let g:pomodoro_time_work = 25
let g:pomodoro_time_slack = 5

let g:pomodoro_do_log = 1
let g:pomodoro_log_file = "/tmp/pomodoro.log"

let g:pomodoro_notification_cmd = "notify-send --icon=neovim 'Pomodoro Timer' 'Your time is up!' --urgency=critical"

let g:which_key_map['P'] =  [ ':call Toggle_Pomodoro()','Toggle Pomodoro' ]

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
" Fuzzy Finder {{{
let g:which_key_map['s'] = [':Telescope find_files', 'Fuzzy search files']
" }}}
" CHADtree {{{
let g:which_key_map['f'] = [ ':CHADopen', 'Toggle File Explorer' ]
" }}}
" NeoGit {{{
lua require('neogit').setup()
" }}}

" Other
" presence.nvim {{{
lua require("presence"):setup()
" }}}
" VIMRC {{{
let g:which_key_map["e"]= {'name': '+edit',
      \ "v": [ ':vsp ~/.config/nvim/init.vim', 'Edit VimRC in VSplit' ], 
      \ }
" }}}

"vim:foldmethod=marker:tabstop=2:softtabstop=2:shiftwidth=2:expandtab
