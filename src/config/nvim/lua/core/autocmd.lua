vim.api.nvim_create_autocmd({"VimLeave"}, {
  pattern = "*",
  command = "et guicursor=a:hor20"
})
