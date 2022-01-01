local theme_name = "__[nvim_color_name]__"
local present, theme = pcall(require, "theme.themes." .. theme_name)
if not present then
  print("Could not load" .. theme_name)
  return false
end

local base16 = {
  base00 = theme.bg,
  base01 = theme.bg,
  base02 = theme.bg_dark,
  base03 = theme.black_br,

  base04 = theme.fg_alt,
  base05 = theme.fg,
  base06 = theme.fg_alter,
  base07 = theme.bg_alt,

  base08 = theme.red,
  base09 = theme.yellow,
  base0A = theme.blue,
  base0B = theme.green,

  base0C = theme.yellow_br,
  base0D = theme.cyan,
  base0E = theme.yellow,
  base0F = theme.red,
}

require("base16-colorscheme").setup(base16)
return theme
