-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/mappings.lua
-- By: @ExtinctAxolotl
local wk = require("which-key")
vim.g.mapleader = " "

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
    f = { "<cmd>NvimTreeToggle<cr>", "Toggle File Manager" },
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
wk.register({
    ["<C-q>"] = { "<cmd>BufferClose<cr>", "Close the current buffer"}
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

-- TrueZen
-- ======
wk.register ({
    Z = {
        name = 'TrueZen',
        a = {"<cmd>TZAtaraxis<cr>", "Ataraxis Mode"},
        m = {"<cmd>TZMinimalist<cr>", "Minimalist Mode"},
        f = {"<cmd>TZFocus<cr>", "Focus Mode"}
    }
}, {prefix = "<leader>"} )


-- vim:foldmethod=marker
