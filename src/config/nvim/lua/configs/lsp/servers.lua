-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/plugins/lsp.lua
-- By: @ExtinctAxolotl

local if_nil = function(val, default)
  if val == nil then
    return default
  end
  return val
end

local update_capabilities = function(capabilities, override)
  override = override or {}

  local completionItem = capabilities.textDocument.completion.completionItem

  completionItem.snippetSupport = if_nil(override.snippetSupport, true)
  completionItem.preselectSupport = if_nil(override.preselectSupport, true)
  completionItem.insertReplaceSupport = if_nil(override.insertReplaceSupport, true)
  completionItem.labelDetailsSupport = if_nil(override.labelDetailsSupport, true)
  completionItem.deprecatedSupport = if_nil(override.deprecatedSupport, true)
  completionItem.commitCharactersSupport = if_nil(override.commitCharactersSupport, true)
  completionItem.tagSupport = if_nil(override.tagSupport, { valueSet = { 1 } })
  completionItem.resolveSupport = if_nil(override.resolveSupport, {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  })

  return capabilities
end

local capabilities = update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
  }

  -- (optional) Customize the options passed to the server
  if server.name == "sumneko_lua" then
    opts = {
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
    }
  end

  if server.name == "cssls" then
    opts.autostart = false
  end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
