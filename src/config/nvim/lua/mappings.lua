-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/mappings.lua
-- By: @ExtinctAxolotl
local wk = require("which-key")
vim.g.mapleader = " "

-- comment reminders
-- =================
wk.register({
    c = "<cmd>echoerr 'Use gcc bindings'<cr>"
})
-- file manager
-- ============
wk.register({
    f = { "<cmd>lua require('lir.float').toggle()<cr>", "Toggle File Manager" },
}, { prefix = "<leader>" })

-- Buffer Management
-- ==================
wk.register({
    b = {
        name = "buffers",
        c = { "<cmd>BufferClose<cr>", "Close" },
        C = { "<cmd>BufferClose!<cr>", "Force to close" },
        h = { "<cmd>BufferPrevious<cr>", "Previous" },
        l = { "<cmd>BufferNext<cr>", "Next" },
        s = { "<cmd>BufferPick<cr>", "Pick" },

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

-- ToggleTerm
-- ==========
wk.register ({
    T = {
        name = 'Terminals',
        c = {"<cmd>lua _Term_cargo_run_toggle()<cr>", "Run Cargo"}
    },

    G = { "<cmd>lua _Term_lazygit()<cr>", "Toggle LazyGit" }

}, { prefix = "<leader>" } )


-- vim:foldmethod=marker
