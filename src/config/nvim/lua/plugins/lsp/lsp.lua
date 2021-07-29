-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/plugins/lsp/init.lua
-- By: @ExtinctAxolotl

require("lspconfig").sumneko_lua.setup({
    cmd = { "lua-language-server" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = true,
            },
        },
    },
})
require("lspconfig").rust_analyzer.setup{}
require("lspconfig").pyright.setup{
    settings = {
        python = {
            venvPath = os.getenv("HOME") .. "/.local/share/virtualenvs"
        }
    }
}

require'lspconfig'.jsonls.setup{}
require'lspconfig'.pyright.setup{}
