vim.g.vim_header = {
    " ▄▄▄· ▐▄• ▄       ▄▄▌        ▄▄▄▄▄▪   ▄▄·    ▌ ▐·▪  • ▌ ▄ ·.",
    "▐█ ▀█  █▌█▌▪ ▄█▀▄ ██•   ▄█▀▄ •██  ██ ▐█ ▌▪  ▪█·█▌██ ·██ ▐███▪",
    "▄█▀▀█  ·██· ▐█▌.▐▌██ ▪ ▐█▌.▐▌ ▐█.▪▐█·██ ▄▄  ▐█▐█•▐█·▐█ ▌▐▌▐█·",
    "▐█▪ ▐▌▪▐█·█▌▐█▌.▐▌▐█▌ ▄▐█▌.▐▌ ▐█▌·▐█▌▐███▌   ███ ▐█▌██ ██▌▐█▌",
    " ▀  ▀ •▀▀ ▀▀ ▀█▄▀▪.▀▀▀  ▀█▄▀▪ ▀▀▀ ▀▀▀·▀▀▀   . ▀  ▀▀▀▀▀  █▪▀▀▀",
}

vim.g.startify_shoutout = { "", "", "made with  on  by @ExtinctAxolotl" }
vim.g.startify_custom_header = vim.fn["startify#center"]({
    vim.fn["startify#pad"](vim.g.vim_header),
    vim.fn["startify#pad"](vim.g.startify_shoutout),
})
