-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/options.lua
-- By: @ExtinctAxolotl

local g = vim.g
local o = vim.o

o.termguicolors = true
o.foldmethod = "marker"
o.exrc = true
o.hls = false
o.errorbells = false
o.hidden = true

-- neovide
o.guifont = "CaskaydiaCove Nerd Font:h10"

g.neovide_cursor_animation_length = 0.15
g.neovide_cursor_trail_length = 0.9
g.neovide_cursor_vfx_mode = "pixiedust" -- On my personal computer, railgun & torpedo crash neovide. That does not mean that it will crash on yours!! Try it out :D
g.neovide_cursor_vfx_particle_lifetime = 0.9
g.neovide_cursor_vfx_particle_density = 5.0
g.neovide_fullscreen = false

-- Tabs
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.autoindent = true
o.expandtab = true

-- Numbers
o.number = true
o.relativenumber = true

o.wrap = false

o.ignorecase = true
o.smartcase = true
o.incsearch = true

o.signcolumn = "yes"
o.scrolloff = 10

o.swapfile = false
o.backup = false
o.undofile = true

local homedir = os.getenv("HOME")
o.undodir = homedir .. "/" .. ".local/share/nvim/undodir"

o.updatetime = 200
o.timeoutlen = 500
o.showmode = false

vim.opt.shortmess:append({ c = true })

o.mouse = "nv"

vim.cmd([[
    filetype on
    filetype plugin indent on
]])

