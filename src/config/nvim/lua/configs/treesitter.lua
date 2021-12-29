local treesitter_configs = require("nvim-treesitter.configs")
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
  },
}

treesitter_configs.setup({
  ensure_installed = {
    "norg",
    "rust",
    "toml",
    "python",
    "bash",
    "fish",
    -- "gdscript", -- never using this honestly
    "json",
    "lua",
    "comment", -- TODO: Does it work?
    -- FIXME(axolotl): works!
  },
  highlight = {
    enable = true,
  },
})