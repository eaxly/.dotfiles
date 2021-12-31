local map = require("core.utils").map
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
