local present, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not present then
    error("TREESITTER.LUA: treesitter not found!")
    return false
end

treesitter_configs.setup({
    ensure_installed = {
        "rust",
        "toml",
        "python",
        "bash",
        "fish",
        "gdscript",
        "comment",
        "json",
        "lua",
        "comment", -- TODO: Does it work?
                   -- FIXME(axolotl): works!
    },
    highlight = {
        enable = true,
    },
})
