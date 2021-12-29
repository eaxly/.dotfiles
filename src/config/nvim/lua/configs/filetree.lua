-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local nvimtree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_respect_buf_cwd = false
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    "notify",
    "packer",
    "qf",
  },
  buftype = { "terminal" },
}

vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

vim.g.nvim_tree_icons = {
  folder = {
    arrow_open =   "",
    arrow_closed = "",
    default =      "",
    open =         "",
    empty =        "",
    empty_open =   "",
    symlink =      "",
    symlink_open = "",
  },
}

nvimtree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { "alpha" },
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {
        { key = "d", cb = tree_cb("trash") },
        { key = "D", cb = tree_cb("remove") },
      },
    },
  },
})

Mapper = require("core.utils").mapper()
Mapper.map(
  "n",
  "<leader>f",
  '<cmd>lua require("core.utils").tree_toggle()<cr>',
  { noremap = true },
  "NvimTree",
  "nvim_tree_toggle",
  "Toggle Nvim Tree"
)
