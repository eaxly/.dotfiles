local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-p>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "rounded",
    winblend = 5,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local cargo_run = Terminal:new({
  cmd = "cargo run",
  direction = "vertical",
  -- dir = "",
  close_on_exit = false,
})
function _Term_cargo_run_toggle()
  cargo_run:toggle()
end

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  close_on_exit = true,
})

function _Term_lazygit()
  lazygit:toggle()
end

local btop = Terminal:new({
  cmd = "btop",
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  close_on_exit = true,
})

function _Term_btop()
  btop:toggle()
end
