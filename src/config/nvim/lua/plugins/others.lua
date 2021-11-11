local M = {}

M.suda = function()
	vim.g.suda_smart_edit = true
end

M.blankline = function()
	vim.g.indent_blankline_char = "│" --""
	vim.g.indent_blankline_filetype_exclude = {
		"alpha",
		"help",
		"dashboard",
		"CHADTree",
		"terminal",
		"man",
		"packer",
		"NvimTree",
		"python",
	} -- indent-blankline breaks on python filetype
	vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
	vim.g.indent_blankline_use_treesitter = true
	vim.g.indent_blankline_show_trailing_blankline_indent = true
	vim.g.indent_blankline_show_current_context = true
	vim.wo.colorcolumn = "99999"
end

M.gitsigns = function()
	local present, gitsigns = pcall(require, "gitsigns")
	if not present then
		return false
	end

	gitsigns.setup({})
end

M.colorizer = function()
	local colorizer = require("colorizer")
	colorizer.setup()
end

M.true_zen = function()
	require("true-zen").setup({
		integrations = {
			twilight = true,
			lualine = true,
		},
	})
end

M.focus = function()
	require("focus").setup()
end

return M
