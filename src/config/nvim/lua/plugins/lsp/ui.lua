-- lsp ui customizations

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	update_in_insert = true,
	-- Enable underline, use default values
	underline = true,
	-- Enable virtual text, override spacing to 4
	virtual_text = {
		spacing = 4,
		prefix = "卑",
	},
})
