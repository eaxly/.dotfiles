local lspsaga = require("lspsaga")
lspsaga.setup({
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = " ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
})
--- In lsp attach function
Mapper = require("utils").mapper()
Mapper.map(
  "n",
  "gr",
  "<cmd>Lspsaga rename<cr>",
  { silent = true, noremap = true },
  "LSPSaga",
  "lspsaga_rename",
  "Use lspsaga to rename the current thing"
)
Mapper.map(
  "n",
  "gx",
  "<cmd>Lspsaga code_action<cr>",
  { silent = true, noremap = true },
  "LSPSaga",
  "lspsaga_code_action",
  "Use lspsaga to list and run code actions"
)
Mapper.map(
  "x",
  "gx",
  ":<c-u>Lspsaga range_code_action<cr>",
  { silent = true, noremap = true },
  "LSPSaga",
  "lspsaga_range_code_action",
  "Use lspsaga to list and run a range code action"
)
Mapper.map(
  "n",
  "K",
  "<cmd>Lspsaga hover_doc<cr>",
  { silent = true, noremap = true },
  "LSPSaga",
  "lspsaga_hover_doc",
  "Use lspsaga to show the docs"
)
Mapper.map(
  "n",
  "go",
  "<cmd>Lspsaga show_line_diagnostics<cr>",
  { silent = true, noremap = true },
  "LSPSaga",
  "lspsaga_show_line_dig",
  "Use lspsaga to show line diagnostics"
)
Mapper.map(
  "n",
  "gj",
  "<cmd>Lspsaga diagnostic_jump_next<cr>",
  { silent = true, noremap = true },
  "LSPSaga",
  "lsp_saga_dig_next",
  "Use lspsaga to jump to the next diagnostic"
)
Mapper.map(
  "n",
  "gk",
  "<cmd>Lspsaga diagnostic_jump_prev<cr>",
  { silent = true, noremap = true },
  "LSPSaga",
  "lspsaga_dig_prev",
  "Use lspsaga to jumpt to the previous diagnostic"
)
-- Mapper.map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
-- Mapper.map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
