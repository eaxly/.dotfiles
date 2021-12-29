-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/plugins/lsp.lua
-- By: @ExtinctAxolotl

local lsp = require("lspconfig")

-- Setup lspconfig.
local caps = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp.sumneko_lua.setup({
  capabilities = caps,
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim", "awesome", "client" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

lsp.rust_analyzer.setup({
  capabilities = caps,
})
lsp.pyright.setup({
  capabilities = caps,
})
lsp.jsonls.setup({
  capabilities = caps,
})
lsp.pyright.setup({
  capabilities = caps,
})
lsp.bashls.setup({
  capabilities = caps,
})
lsp.cssls.setup({
  capabilities = caps,
})
lsp.tsserver.setup({
  capabilities = caps,
})