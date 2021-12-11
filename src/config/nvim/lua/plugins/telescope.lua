local telescope = require("telescope")

telescope.setup({
    defaults = {
        layout_strategy = "flex",
    },
    extensions = {
        mapper = {},
    },
})
telescope.load_extension("mapper")

Mapper = require("utils").mapper()
Mapper.map(
    "n",
    "<leader>s",
    "<cmd>Telescope find_files<cr>",
    { noremap = true },
    "Telescope",
    "telescope_find_files",
    "Search for files in the current directory with telescope"
)
