local map = require("core.utils").mapper().map
local c = require("colors.config.theme")

require("bufferline").setup({
  options = {
    numbers = "none",
    close_command = "Bdelete %d",
    right_mouse_command = "Bdelete %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "" } },
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = "directory",
  },
  highlights = {
    fill = {
      guibg = c.bg,
    }
  }
})

map("n", "<leader>bl", "<cmd>BufferLineCycleNext<cr>", { noremap = true }, "BufferLine", "bufferline_cycle_next", "Select next buffer in bufferline")
map("n", "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", { noremap = true }, "BufferLine", "bufferline_cycle_prev", "Select next buffer in bufferline")
map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { noremap = true }, "bufferline", "bufferline_pick", "Pick a buffer in the bufferline")
map("n", "<leader>bc", "<cmd>Bdelete<cr>", { noremap = true }, "BufDelete", "bufdelete", "Delete current buffer whilst preserving window layout")
map("n", "<leader>bC", "<cmd>Bdelete!<cr>", { noremap = true }, "BufDelete", "bufdelete_force", "Force Delete the current buffer whilst preserving the window layout")

map("n", "<leader>bse", "<cmd>BufferLineSortByExtension", { noremap = true }, "BufferLine", "bufferline_sort_extension", "Sort by extension in bufferline")

