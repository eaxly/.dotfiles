vim.api.nvim_create_autocmd({"VimLeave"}, {
  pattern = "*",
  command = "set guicursor=a:hor20"
})
