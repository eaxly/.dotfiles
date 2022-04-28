-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- By: @ExtinctAxolotl
local utils = require("core.utils")
local map = utils.map
local legend = utils.legend

local M = {}

M.misc = function()
  local function foomaps()
    map({ "v", "n" }, "<leader>Cy", '"+y', "yank to clipboard", { noremap = true })
    map({ "v", "n" }, "<leader>Cp", '"+p', "paste from clipboard", { noremap = true })
    map({ "v", "n" }, "<leader>CP", '"+P', "PASTE from clipboard", { noremap = true })
    map("t", "<a-esc>", "<C-\\><C-n>", "escape the terminal")
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
  map("n", "<leader>f", "<cmd>NvimTreeToggle<cr>", "nvim-tree - toggle nvim tree")
end

M.lsp = function()
  map("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", "lsp - rename")
  map("n", "gx", "<cmd>lua vim.lsp.buf.code_action()<cr>", "lsp - code action")
  map("n", "K", "<cmd>lua vim.lsp.buf.definition()<cr>", "lsp - go to definition")
  map("n", "go", "<cmd>lua vim.diagnostic.setloclist()<cr>", "lsp - open diagnostics window")
  map("n", "gj", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "lsp - go to previous diagnostic")
  map("n", "gk", "<cmd>lua vim.diagnostic.goto_next()<cr>", "lsp - go to previous diagnostic")
end

M.zen = function()
  map("n", "<leader>Za", "<cmd>TZAtaraxis<cr>", "truezen - enable ataraxis mode")
  map("n", "<leader>Zm", "<cmd>TZMinimalist<cr>", "truezen - enable einimalist mode")
  map("n", "<leader>Zf", "<cmd>TZFocus<cr>", "truezen - enable eocus mode")
end

M.mundo = function()
  map("n", "<leader>u", "<cmd>MundoToggle<cr>", "mundo - toggle mundo")
end

M.telescope = function()
  map("n", "<leader>s", "<cmd>Telescope find_files<cr>", "telescope - search files in current directory")
  map("n", "<leader>th", "<cmd>Telescope oldfiles<cr>", "telescope - search file history")
  map("n", "<leader>tg", "<cmd>Telescope grep_string<cr>", "telescope - grep a string")
end

M.term = function()
  map("n", "<leader>Tc", "<cmd>lua _Term_cargo_run_toggle()<cr>", "term - run 'cargo run' in terminal")
  map("n", "<leader>G", "<cmd>lua _Term_lazygit()<cr>", "term - toggle lazygit")
end

M.bufferline = function()
  map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", "bufferline - select next buffer")
  map("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", "bufferline - select prevous buffer")
  map("n", "<c-tab>", "<cmd>BufferLineMoveNext<cr>", "bufferline - move next buffer")
  map("n", "<c-s-tab>", "<cmd>BufferLineMovePrev<cr>", "bufferline - move previous buffer")
  map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", "bufferline - pick a buffer")
  map("n", "<leader>bc", "<cmd>Bdelete<cr>", "bufferline - soft-delete a buffer")
  map("n", "<leader>bC", "<cmd>Bdelete!<cr>", "bufferline - sudo soft-delete a buffer")
  map("n", "<leader>bd", "<cmd>bdelete<cr>", "bufferline - hard-delete a buffer")
  map("n", "<leader>bD", "<cmd>bdelete!<cr>", "bufferline - sudo hard-delete a buffer")

  map("n", "<leader>bse", "<cmd>BufferLineSortByExtension", "sort buffers by extension")
end

M.commentbox = function()
  map({ "n", "v" }, "gBc", "<cmd>lua require('comment-box').cbox()<cr>", "commentbox - make a centered comment box")
  map({ "n", "v" }, "gBl", "<cmd>lua require('comment-box').lbox()<cr>", "commentbox - make a comment box")
end

M.neorg = function ()
  legend("n", "gtu", "neorg - set task undone"  )
  legend("n", "gtp", "neorg - set task pending"  )
  legend("n", "gtd", "neorg - set task done"  )
  legend("n", "gth", "neorg - set task on hold"  )
  legend("n", "gtc", "neorg - set task cancelled"  )
  legend("n", "gtr", "neorg - set task as reoccuring"  )
  legend("n", "gti", "neorg - set task as important"  )
  legend("n", "<C-Space>", "neorg - cycle task states"  )
  legend("n", "<leader>tc", "neorg - gtd capture" )
  legend("n", "<leader>tv", "neorg - gtd views" )
  legend("n", "<leader>te", "neorg - gtd edit" )
  legend("n", "<leader>nn", "neorg - dirman new note" )
  legend("n", "<M-CR>", "neorg - hop link")
end

M.legendary = function()
  map("n", "<leader>?", "<cmd>Legendary<cr>", "legendary - open legendary")
end

return M
