local present, autopairs = pcall(require, "nvim-autopairs")
if not present then
  print("autopairs not present")
  return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "alpha" },
  disable_in_macro = false, -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
  enable_moveright = true,
  enable_afterquote = true, -- add bracket pairs after quote
  enable_check_bracket_line = true, --- check bracket in same line
  enable_bracket_in_quote = true,
  check_ts = true,
  map_cr = true,
  map_bs = true, -- map the <BS> key
  map_c_w = true, -- map <c-w> to delete a pair if possible
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
