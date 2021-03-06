local present, c = pcall(require, "theme.config.colors")
if not present then
  return
end

return {
  normal = {
    a = { bg = c.green, fg = c.bg },
    b = { bg = c.bg_alt, fg = c.fg },
    c = { bg = c.bg, fg = c.fg_alter },
  },
  insert = {
    a = { bg = c.blue, fg = c.bg },
    b = { bg = c.bg_alt, fg = c.fg },
    c = { bg = c.bg, fg = c.fg_alter },
  },
  visual = {
    a = { bg = c.magenta, fg = c.bg },
    b = { bg = c.bg_alt, fg = c.fg },
    c = { bg = c.bg, fg = c.fg_alter },
  },
  replace = {
    a = { bg = c.red, fg = c.bg },
    b = { bg = c.bg_alt, fg = c.fg },
    c = { bg = c.bg, fg = c.fg_alter },
  },
  command = {
    a = { bg = c.yellow, fg = c.bg },
    b = { bg = c.bg_alt, fg = c.fg },
    c = { bg = c.bg, fg = c.fg_alter },
  },
  inactive = {
    a = { bg = c.bg, fg = c.black_br },
    b = { bg = c.bg, fg = c.black_br },
    c = { bg = c.bg, fg = c.black_br },
  },
}
