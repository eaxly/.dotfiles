-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- By: @ExtinctAxolotl
local map = require("core.utils").map
local M = {}

M.misc = function()
  map({ "v", "n" }, "<leader>Cy", '"+y', { noremap = true })
  map({ "v", "n" }, "<leader>Cp", '"+p', { noremap = true })
  map({ "v", "n" }, "<leader>CP", '"+p', { noremap = true })
end

M.filetree = function()
  map("n", "<leader>f", "<cmd>NvimTreeToggle<cr>")
end

M.lspsaga = function ()
  map("n", "gr", "<cmd>Lspsaga rename<cr>")
  map("n", "gx", "<cmd>Lspsaga code_action<cr>")
  map("x", "gx", ":<c-u>Lspsaga range_code_action<cr>")
  map("n", "K", "<cmd>Lspsaga hover_doc<cr>")
  map("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>")
  map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>")
  map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
end

M.zen = function ()
  map(
    "n",
    "<leader>Za",
    "<cmd>TZAtaraxis<cr>"
  )
  map(
    "n",
    "<leader>Zm",
    "<cmd>TZMinimalist<cr>"
  )
  map("n", "<leader>Zf", "<cmd>TZFocus<cr>")
end


M.mundo = function()
  map("n", "<leader>u", "<cmd>MundoToggle<cr>", { noremap = true })
end

M.telescope = function ()
  map(
    "n",
    "<leader>s",
    "<cmd>Telescope find_files<cr>",
    { noremap = true })
  map(
    "n",
    "<leader>th",
    "<cmd>Telescope oldfiles<cr>",
    { noremap = true }
    )
end

M.term = function ()
  map(
    "n",
    "<leader>Tc",
    "<cmd>lua _Term_cargo_run_toggle()<cr>",
    { noremap = true }
  )
  map(
    "n",
    "<leader>G",
    "<cmd>lua _Term_lazygit()<cr>",
    { noremap = true }
  )
end

M.bufferline = function ()
  map("n", "<leader>bl", "<cmd>BufferLineCycleNext<cr>")
  map("n", "<leader>bh", "<cmd>BufferLineCyclePrev<cr>")
  map("n", "<leader>bp", "<cmd>BufferLinePick<cr>")
  map("n", "<leader>bc", "<cmd>Bdelete<cr>")
  map("n", "<leader>bC", "<cmd>Bdelete!<cr>")

  map("n", "<leader>bse", "<cmd>BufferLineSortByExtension")
end

return M
