local present, c = pcall(require, "theme.config.colors")
if not present then
  return
end


return {
  normal = {
    a = {bg = c.green, fg = c.bg, gui = 'bold'},
    b = {bg = c.bg_alt, fg = c.fg},
    c = {bg = c.bg, fg = c.fg_alter}
  },
  insert = {
    a = {bg = c.blue, fg = c.bg, gui = 'bold'},
    b = {bg = c.bg_alt, fg = c.fg},
    c = {bg = c.bg, fg = c.fg_alter}
  },
  visual = {
    a = {bg = c.magenta, fg = c.bg, gui = 'bold'},
    b = {bg = c.bg_alt, fg = c.fg},
    c = {bg = c.bg, fg = c.fg_alter}
  },
  replace = {
    a = {bg = c.red, fg = c.bg, gui = 'bold'},
    b = {bg = c.bg_alt, fg = c.fg},
    c = {bg = c.bg, fg = c.fg_alter}
  },
  command = {
    a = {bg = c.yellow, fg = c.bg, gui = 'bold'},
    b = {bg = c.bg_alt, fg = c.fg},
    c = {bg = c.bg, fg = c.fg_alter}
  },
  inactive = {
    a = {bg = c.darkgray, fg = c.gray, gui = 'bold'},
    b = {bg = c.darkgray, fg = c.gray},
    c = {bg = c.darkgray, fg = c.gray}
  }
}
