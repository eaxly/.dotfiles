-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/plugins/lsp.lua
-- By: @eaxly
local lsp = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  { id = "sumneko_lua", man = true },
  { id = "cssls", man = false },
  { id = "rust_analyzer", man = false },
  { id = "gopls", man = false },
  { id = "pyright", man = false },
}

---@name string
local function server_setup(name, caps, langsp, settings)
  local args = {}
  if settings then
    args.settings = settings
  end
  args.capabilities = caps

  langsp[name].setup(args)
end

for _, s in ipairs(servers) do
  if s.man ~= true then
    server_setup(s.id, capabilities, lsp)
  end
end

lsp.sumneko_lua.setup({
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
  capabilities = capabilities,
})
