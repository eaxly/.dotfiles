-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/plugins/lsp.lua
-- By: @ExtinctAxolotl

local lsp = require("lspconfig")
local coq = require("coq")

lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities({
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
				enable = true,
			},
		},
	},
}))

lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())
lsp.pyright.setup(coq.lsp_ensure_capabilities())

lsp.jsonls.setup(coq.lsp_ensure_capabilities())
lsp.pyright.setup(coq.lsp_ensure_capabilities())
