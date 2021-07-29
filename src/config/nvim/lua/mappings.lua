-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/mappings.lua
-- By: @ExtinctAxolotl
local wk = require("which-key")
vim.g.mapleader = " "

-- compe {{{
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-Space>", "compe#complete()", {expr = true})
-- }}}

-- Kommenting
-- =========
wk.register({
    c = {
        name = "kommenting",
        c = { "<Plug>kommentary_line_default", "Komment Line" },
        ["<space>"] = { "<Plug>kommentary_motion_default", "Motion Comment" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    c = {
        name = "kommenting",
        c = { "<Plug>kommentary_visual_default", "Komment Lines" },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})

-- file manager
-- ============
wk.register({
    f = { "<cmd>CHADopen<cr>", "Toggle File Manager" },
}, { prefix = "<leader>" })

-- Buffer Management
-- ==================
wk.register({
    b = {
        name = "buffers",
        c = { "<cmd>BufferClose<cr>", "Close the current buffer" },
        h = { "<cmd>BufferPrevious<cr>", "Previous Buffer" },
        l = { "<cmd>BufferNext<cr>", "Next Buffer" },
        s = { "<cmd>BufferPick<cr>", "Pick Buffer" },

        o = "Order Buffers",
        od = { "<cmd>BufferOrderByDirectory<cr>", "by Directory" },
        ol = { "<cmd>BufferOrderByLanguage<cr>", "by Language" },
    },
}, {
    prefix = "<leader>",
})

-- Undo Tree
-- =========
wk.register({
    u = { "<cmd>MundoToggle<cr>", "Toggle Undo Tree" },
}, { prefix = "<leader>" })

-- Telescope
-- =========
wk.register({
    s = { "<cmd>Telescope find_files<cr>", "Toggle Fuzzy search" },
}, {
    prefix = "<leader>",
})

-- Lazygit
-- ======
wk.register ({
    G = {"<cmd>LazyGit<cr>", "Toggle Lazy Git"}
}, {prefix = "<leader>"})

-- Clipboard
-- ======

wk.register({
    C = {
        name = 'clipboard',
        y = {'"+y','Yank'},
    }
}, {prefix = "<leader>", mode = "v"})

wk.register({
    C = {
        name = 'clipboard',
        y = {'"+y','Yank'},
        p = {'"+p','Paste'},
        P = {'"+P','Paste'},
    }
}, {prefix = "<leader>"})



-- vim:foldmethod=marker
