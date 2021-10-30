local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
    ensure_installed = {
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
