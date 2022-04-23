-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- By: @ExtinctAxolotl
local map = require("core.utils").map
local M = {}

M.misc = function()
	local function foomaps()
		map({ "v", "n" }, "<leader>Cy", '"+y', "yank to clipboard", { noremap = true })
		map({ "v", "n" }, "<leader>Cp", '"+p', "paste from clipboard" ,{ noremap = true })
		map({ "v", "n" }, "<leader>CP", '"+P', "PASTE from clipboard", { noremap = true })
    map("t", "<a-esc>", '<C-\\><C-n>', "escape the terminal")
	end

	local function required_maps()
		-- Add Packer commands because we are not loading it at startup
		vim.cmd("silent! command PackerClean lua require 'pack' require('packer').clean()")
		vim.cmd("silent! command PackerCompile lua require 'pack' require('packer').compile()")
		vim.cmd("silent! command PackerInstall lua require 'pack' require('packer').install()")
		vim.cmd("silent! command PackerStatus lua require 'pack' require('packer').status()")
		vim.cmd("silent! command PackerSync lua require 'pack' require('packer').sync()")
		vim.cmd("silent! command PackerUpdate lua require 'pack' require('packer').update()")
		-- vim.cmd("silent! command PackerProfile lua require 'pack' require('packer').output_profile()")
	end
	foomaps()
	required_maps()
end

M.filetree = function()
	map("n", "<leader>f", "<cmd>NvimTreeToggle<cr>", "Toggle nvim tree")
end

M.lsp = function()
	map("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", "rename")
	map("n", "gx", "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action")
	map("n", "K", "<cmd>lua vim.lsp.buf.definition()<cr>", "go to definition")
	map("n", "go", "<cmd>lua vim.diagnostic.setloclist()<cr>", "open diagnostics window")
	map("n", "gj", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "go to previous diagnostic")
	map("n", "gk", "<cmd>lua vim.diagnostic.goto_next()<cr>", "go to previous diagnostic")
end

M.zen = function()
	map("n", "<leader>Za", "<cmd>TZAtaraxis<cr>", "enable ataraxis mode")
	map("n", "<leader>Zm", "<cmd>TZMinimalist<cr>", "enable einimalist mode")
	map("n", "<leader>Zf", "<cmd>TZFocus<cr>", "enable eocus mode")
end

M.mundo = function()
	map("n", "<leader>u", "<cmd>MundoToggle<cr>", "toggle mundo")
end

M.telescope = function()
	map("n", "<leader>s", "<cmd>Telescope find_files<cr>", "search files in current directory")
	map("n", "<leader>th", "<cmd>Telescope oldfiles<cr>", "search file history")
	map("n", "<leader>tg", "<cmd>Telescope grep_string<cr>", "grep a string")
end

M.term = function()
	map("n", "<leader>Tc", "<cmd>lua _Term_cargo_run_toggle()<cr>", "run 'cargo run' in terminal")
	map("n", "<leader>G", "<cmd>lua _Term_lazygit()<cr>", "toggle lazygit")
end

M.bufferline = function()
	map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", "select next buffer")
	map("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", "select prevous buffer")
	map("n", "<c-tab>", "<cmd>BufferLineMoveNext<cr>", "move next buffer")
	map("n", "<c-s-tab>", "<cmd>BufferLineMovePrev<cr>", "move previous buffer")
	map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", "pick a buffer")
	map("n", "<leader>bc", "<cmd>Bdelete<cr>", "soft-delete a buffer")
	map("n", "<leader>bC", "<cmd>Bdelete!<cr>", "sudo soft-delete a buffer")
	map("n", "<leader>bd", "<cmd>bdelete<cr>", "hard-delete a buffer")
	map("n", "<leader>bD", "<cmd>bdelete!<cr>", "sudo hard-delete a buffer")

	map("n", "<leader>bse", "<cmd>BufferLineSortByExtension", "sort buffers by extension")
end

M.commentbox = function()
	map({ "n", "v" }, "gBc", "<cmd>lua require('comment-box').cbox()<cr>", "make a centered comment box")
	map({ "n", "v" }, "gBl", "<cmd>lua require('comment-box').lbox()<cr>", "make a comment box")
end

return M
