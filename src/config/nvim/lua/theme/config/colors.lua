local theme_name =  "__[nvim_color_name]__"
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
  base06 = theme.fg_light,
  base07 = theme.bg_alt,

  base08 = theme.red,
  base09 = theme.yellow,
  base0A = theme.yellow,
  base0B = theme.green,

  base0C = theme.cyan,
  base0D = theme.blue,
  base0E = theme.magenta,
  base0F = theme.magenta_br,
}

require("base16-colorscheme").setup(base16)
return theme
