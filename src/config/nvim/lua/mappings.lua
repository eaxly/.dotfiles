-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/mappings.lua
-- By: @ExtinctAxolotl
local wk = require("which-key")
vim.g.mapleader = " "

function _Neovide_toggle_fullscreen()
    vim.cmd [[
        if g:neovide_fullscreen==v:true
            let g:neovide_fullscreen=v:false
        else
            let g:neovide_fullscreen=v:true
        end
    ]]
end

-- comment reminders
-- =================
wk.register({
    c = { "<cmd>echoerr 'Use gcc'<cr>", "nope" },
}, {prefix = "<leader>"})
-- file manager
-- ============
wk.register({
    f = { "<cmd>lua require('lir.float').toggle()<cr>", "Toggle File Manager" },
}, { prefix = "<leader>" })

-- Bufferline
-- ==================
wk.register({
    b = {
        name = "buffers",
        c = { "<cmd>bdelete<cr>", "Close" },
        C = { "<cmd>bdelete!<cr>", "Force Close" },
        h = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        l = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        x = { "<cmd>BufferLinePick<cr>", "Pick" },
        X = { "<cmd>BufferLinePickClose<cr>", "Close Pick" },

        s = {
            name = "Sort Buffers",
            d = { "<cmd>BufferLineSortByDirectory<cr>", "by Directory" },
            x = { "<cmd>BufferLineSortByExtension<cr>", "by Extension" },
        }
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
        c = {"<cmd>lua _Term_cargo_run_toggle()<cr>", "Run Cargo"},
    },

    G = { "<cmd>lua _Term_lazygit()<cr>", "Toggle LazyGit" }

}, { prefix = "<leader>" } )

-- LSP and others
-- ==============
wk.register ({
    ["<C-s>"] = { "<cmd>:w<cr>", "write" },
    ["<F2>"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
    ["<F11>"] = {"<cmd>lua _Neovide_toggle_fullscreen()<cr>", "Fullscreen"},
})
-- vim:foldmethod=marker
