local theme = "__[nvim_color_name]__"

-- rose pine
if theme == "rose-pine" then
  vim.g.rose_pine_disable_background = false
  vim.g.rose_pine_variant = "__[nvim_color_style]__"

  vim.g.rose_pine_bold_vertical_split_line = true
  vim.g.rose_pine_inactive_background = false
  vim.g.rose_pine_disable_background = false
  vim.g.rose_pine_disable_float_background = false
  vim.g.rose_pine_disable_italics = false

  local p = require("rose-pine.palette")
  vim.g.rose_pine_colors = {
    headings = {
      h1 = p.iris,
      h2 = p.foam,
      h3 = p.rose,
      h4 = p.gold,
      h5 = p.pine,
      h6 = p.foam,
    },
  }

  vim.cmd([[colorscheme __[nvim_color_name]__]])
elseif theme == "catppuccin" then

end
